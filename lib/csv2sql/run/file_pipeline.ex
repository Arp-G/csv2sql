defmodule Csv2sql.Run.FilePipeline do
  @moduledoc """
  The per-file pipeline: analyze → DDL → load.

  Pass 1 streams the file once for type inference (chunked, parallel,
  constant memory). Pass 2 streams it again, encoding and inserting chunks
  with bounded concurrency — backpressure is inherent: when all insert
  workers are busy, reading pauses.

  Every phase returns a tagged result; a failing phase marks *this* file
  failed and the run continues.
  """

  alias Csv2sql.Config
  alias Csv2sql.Error
  alias Csv2sql.Events

  alias Csv2sql.Events.{
    AnalyzeCompleted,
    AnalyzeStarted,
    FileCompleted,
    FileFailed,
    LoadProgress,
    RowsRejected,
    SchemaCreated,
    ValidationResult
  }

  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Load.Chunker
  alias Csv2sql.Load.Encoder
  alias Csv2sql.Load.ErrorsCsv
  alias Csv2sql.Load.Inserter
  alias Csv2sql.Run.Artifacts
  alias Csv2sql.Run.Server
  alias Csv2sql.Schema.Inference
  alias Csv2sql.Schema.Resolve
  alias Csv2sql.Source.Reader
  alias Csv2sql.Validate.Fingerprint
  alias Csv2sql.Validate.Ledger
  alias Csv2sql.Validate.Runner

  @type ctx :: %{
          run_id: String.t(),
          config: Config.t(),
          adapter: module(),
          conn: Csv2sql.Adapter.conn(),
          parsers: Encoder.parsers(),
          artifacts_dir: Path.t(),
          max_insert_bytes: pos_integer() | nil
        }

  @doc "Processes one file; always returns the file's final state."
  @spec run(CsvFile.t(), ctx()) :: CsvFile.t()
  def run(%CsvFile{} = file, ctx) do
    with {:ok, file} <- analyze(file, ctx),
         {:ok, file} <- maybe_import(file, ctx) do
      file = %{file | status: :done}
      update(ctx, file)

      Events.emit(ctx.run_id, FileCompleted,
        path: file.path,
        ledger: file.ledger,
        timings: file.timings
      )

      file
    else
      {:error, %CsvFile{} = file, %Error{} = error} ->
        file = CsvFile.fail(file, error)
        update(ctx, file)
        Events.emit(ctx.run_id, FileFailed, path: file.path, error: error)
        maybe_strict_halt(error, ctx)
        file
    end
  end

  # Run-class errors already halt the run; strict mode escalates any
  # file failure into a run halt.
  defp maybe_strict_halt(%Error{class: :run}, _ctx), do: :ok

  defp maybe_strict_halt(
         %Error{} = error,
         %{config: %Config{error_policy: %{strict: true}}} = ctx
       ) do
    strict_error = %{error | class: :run, reason: "strict_file_failure"}
    Server.fail_run(ctx.run_id, strict_error)
  end

  defp maybe_strict_halt(_error, _ctx), do: :ok

  # -- Pass 1: analyze --------------------------------------------------------

  defp analyze(file, ctx) do
    update(ctx, %{file | status: :analyzing})
    Events.emit(ctx.run_id, AnalyzeStarted, path: file.path)
    started = System.monotonic_time(:millisecond)

    source = Reader.detect(file.path, ctx.config)
    file = %{file | encoding: source.encoding, delimiter: source.delimiter}

    case Reader.headers!(file.path, source) do
      [] ->
        {:error, file, Error.file_error(:parse, file.path, :empty_file, "file has no header row")}

      headers ->
        column_count = length(headers)

        acc =
          file.path
          |> Reader.data_stream(source)
          |> Stream.chunk_every(ctx.config.analyze_chunk_rows)
          # CPU-bound: cap at core count regardless of file_workers — the
          # file-level fan-out is bounded separately, and N files × N chunk
          # tasks would oversubscribe quadratically.
          |> Task.async_stream(&Inference.chunk_stats(&1, column_count, ctx.parsers),
            max_concurrency: System.schedulers_online(),
            ordered: false,
            timeout: :infinity
          )
          |> Enum.reduce(Inference.new(column_count), fn {:ok, chunk_acc}, acc ->
            Inference.merge(acc, chunk_acc)
          end)

        override = Config.override_for(ctx.config, file.name)
        columns = Resolve.columns(headers, acc, ctx.config, override)
        sample_rows = file.path |> Reader.data_stream(source) |> Enum.take(10)

        file =
          %{
            file
            | row_count: acc.row_count,
              columns: columns,
              source_headers: headers,
              sample_rows: sample_rows
          }
          |> CsvFile.put_timing(:analyze_ms, System.monotonic_time(:millisecond) - started)

        update(ctx, file)

        Events.emit(ctx.run_id, AnalyzeCompleted,
          path: file.path,
          row_count: acc.row_count,
          columns: columns
        )

        {:ok, file}
    end
  rescue
    exception in [NimbleCSV.ParseError, Reader.EncodingError] ->
      {:error, file, Error.from_exception(:parse, file.path, exception)}

    exception ->
      {:error, file, Error.from_exception(:analyze, file.path, exception)}
  end

  # -- DDL + Pass 2: load -----------------------------------------------------

  defp maybe_import(file, %{config: %Config{mode: :analyze}} = ctx) do
    # Dry runs still produce a reviewable schema.sql (nothing touches
    # the database — DDL generation is pure).
    Artifacts.append_schema(ctx.artifacts_dir, file.name, ddl_statements(file, ctx))
    update(ctx, file)
    {:ok, file}
  end

  defp maybe_import(file, ctx) do
    with {:ok, file} <- create_schema(file, ctx),
         baseline = capture_baseline(file, ctx),
         {:ok, file} <- load(file, ctx) do
      validate(file, baseline, ctx)
    end
  end

  # Append mode adds to existing rows — counts must be baseline-aware.
  defp capture_baseline(_file, %{config: %Config{table_mode: :drop}}), do: 0

  defp capture_baseline(file, ctx) do
    case ctx.adapter.exact_count(ctx.conn, file.table_name) do
      {:ok, count} -> count
      {:error, _error} -> 0
    end
  end

  defp validate(file, baseline, ctx) do
    update(ctx, %{file | status: :validating})
    started = System.monotonic_time(:millisecond)
    outcomes = Runner.run(file, file.fingerprints, baseline, ctx)

    Enum.each(outcomes, fn outcome ->
      Events.emit(ctx.run_id, ValidationResult,
        path: file.path,
        layer: outcome.layer,
        status: outcome.status,
        detail: outcome.detail
      )
    end)

    file =
      %{file | validation: outcomes}
      |> CsvFile.put_timing(:validate_ms, System.monotonic_time(:millisecond) - started)

    {:ok, file}
  rescue
    exception -> {:error, file, Error.from_exception(:validate, file.path, exception)}
  end

  defp create_schema(file, ctx) do
    update(ctx, %{file | status: :creating_schema})
    started = System.monotonic_time(:millisecond)
    statements = ddl_statements(file, ctx)

    case run_statements(ctx, statements) do
      :ok ->
        file = CsvFile.put_timing(file, :ddl_ms, System.monotonic_time(:millisecond) - started)
        Artifacts.append_schema(ctx.artifacts_dir, file.name, statements)

        Events.emit(ctx.run_id, SchemaCreated,
          path: file.path,
          table: file.table_name,
          ddl: Enum.join(statements, ";\n") <> ";"
        )

        {:ok, file}

      {:error, exception} ->
        {:error, file, %{Error.from_exception(:ddl, file.path, exception) | class: :file}}
    end
  end

  defp ddl_statements(file, ctx) do
    drop_sql = IO.iodata_to_binary(ctx.adapter.drop_table_sql(file.table_name))
    create_sql = IO.iodata_to_binary(ctx.adapter.create_table_sql(file.table_name, file.columns))

    case ctx.config.table_mode do
      :drop -> [drop_sql, create_sql]
      :append -> [create_sql]
    end
  end

  defp run_statements(_ctx, []), do: :ok

  defp run_statements(ctx, [sql | rest]) do
    case ctx.adapter.query(ctx.conn, sql, []) do
      {:ok, _result} -> run_statements(ctx, rest)
      {:error, exception} -> {:error, exception}
    end
  end

  defp load(file, ctx) do
    update(ctx, %{file | status: :loading})
    started = System.monotonic_time(:millisecond)

    limits =
      Chunker.limits(
        ctx.config.insert_chunk_rows,
        ctx.adapter.max_params(),
        ctx.max_insert_bytes,
        length(file.columns)
      )

    errors_csv = ErrorsCsv.new(ctx.artifacts_dir, file.name, csv_headers(file))
    initial = %{ledger: Ledger.new(), fps: Fingerprint.init(file.columns), errors_csv: errors_csv}

    outcome =
      file.path
      |> Reader.data_stream(%{encoding: file.encoding, delimiter: file.delimiter})
      |> Stream.with_index(1)
      |> Chunker.chunks(limits)
      |> Task.async_stream(&Inserter.insert_chunk(&1, file, ctx),
        max_concurrency: ctx.config.insert_workers,
        ordered: false,
        timeout: :infinity
      )
      |> Enum.reduce_while(initial, &accumulate(&1, &2, file, ctx))

    finalize_load(outcome, file, ctx, started)
  rescue
    exception -> {:error, file, Error.from_exception(:load, file.path, exception)}
  end

  # The single-writer accumulation fold: merges chunk ledgers and
  # fingerprints, writes rejected rows, emits progress, and trips the
  # per-file circuit breaker. Halting closes the stream, which shuts
  # down in-flight insert tasks.
  defp accumulate({:ok, {:ok, chunk_outcome}}, state, file, ctx) do
    state = %{
      state
      | ledger: Ledger.merge(state.ledger, chunk_outcome.ledger),
        fps: Fingerprint.merge(state.fps, chunk_outcome.fingerprints),
        errors_csv: ErrorsCsv.append(state.errors_csv, chunk_outcome.rejected)
    }

    emit_rejections(chunk_outcome.rejected, file, ctx)

    Events.emit(ctx.run_id, LoadProgress,
      path: file.path,
      rows_inserted: state.ledger.rows_inserted,
      rows_rejected: state.ledger.rows_rejected
    )

    if threshold_tripped?(state.ledger, ctx.config.error_policy) do
      {:halt, {:threshold, state}}
    else
      {:cont, state}
    end
  end

  defp accumulate({:ok, {kind, %Error{} = error}}, state, _file, _ctx)
       when kind in [:file_error, :run_abort] do
    {:halt, {kind, error, state}}
  end

  defp accumulate({:exit, reason}, state, file, _ctx) do
    {:halt, {:file_error, Error.from_caught(:load, file.path, :exit, reason), state}}
  end

  defp finalize_load(%{ledger: ledger} = state, file, _ctx, started) do
    file = close_load(file, state, started)

    if Ledger.balanced?(ledger) do
      {:ok, file}
    else
      message =
        "ledger imbalance: read #{ledger.rows_read} != " <>
          "inserted #{ledger.rows_inserted} + rejected #{ledger.rows_rejected}"

      {:error, file, Error.file_error(:load, file.path, :ledger_mismatch, message)}
    end
  end

  defp finalize_load({:threshold, state}, file, ctx, started) do
    file = close_load(file, state, started)
    policy = ctx.config.error_policy
    ledger = state.ledger
    percent = Float.round(ledger.rows_rejected * 100 / max(ledger.rows_read, 1), 1)

    message =
      "#{percent}% of rows rejected (threshold #{policy.row_error_threshold_pct}%) " <>
        "after #{ledger.rows_read} rows; #{ledger.rows_inserted} rows were inserted " <>
        "before stopping"

    {:error, file, Error.file_error(:load, file.path, :rejection_threshold_exceeded, message)}
  end

  defp finalize_load({:file_error, error, state}, file, _ctx, started) do
    {:error, close_load(file, state, started), error}
  end

  defp finalize_load({:run_abort, error, state}, file, ctx, started) do
    # Everything is about to fail the same way — halt the whole run with
    # one honest cause instead of N identical per-file failures.
    Server.fail_run(ctx.run_id, error)
    {:error, close_load(file, state, started), error}
  end

  defp close_load(file, state, started) do
    %{
      file
      | ledger: state.ledger,
        fingerprints: state.fps,
        errors_csv: ErrorsCsv.path(state.errors_csv)
    }
    |> CsvFile.put_timing(:load_ms, System.monotonic_time(:millisecond) - started)
  end

  defp emit_rejections([], _file, _ctx), do: :ok

  defp emit_rejections(rejected, file, ctx) do
    Events.emit(ctx.run_id, RowsRejected,
      path: file.path,
      count: length(rejected),
      sample_reasons: rejected |> Enum.take(3) |> Enum.map(& &1.reason)
    )
  end

  defp threshold_tripped?(ledger, policy) do
    ledger.rows_read >= policy.row_error_min_sample and
      ledger.rows_rejected * 100 > ledger.rows_read * policy.row_error_threshold_pct
  end

  # The original CSV headers — errors.csv rows mirror the source file
  # (all columns, excluded ones included) so they can be fixed and
  # re-imported.
  defp csv_headers(file), do: file.source_headers

  defp update(ctx, file), do: Server.file_update(ctx.run_id, file)
end
