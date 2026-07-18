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
    SchemaCreated
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
  alias Csv2sql.Validate.Ledger

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

        columns = Resolve.columns(headers, acc, ctx.config)

        file =
          %{file | row_count: acc.row_count, columns: columns}
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
    with {:ok, file} <- create_schema(file, ctx) do
      load(file, ctx)
    end
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
      |> Enum.reduce_while({Ledger.new(), errors_csv}, &accumulate(&1, &2, file, ctx))

    finalize_load(outcome, file, ctx, started)
  rescue
    exception -> {:error, file, Error.from_exception(:load, file.path, exception)}
  end

  # The single-writer accumulation fold: merges chunk ledgers, writes
  # rejected rows, emits progress, and trips the per-file circuit breaker.
  # Halting closes the stream, which shuts down in-flight insert tasks.
  defp accumulate(
         {:ok, {:ok, %{ledger: delta, rejected: rejected}}},
         {ledger, errors_csv},
         file,
         ctx
       ) do
    ledger = Ledger.merge(ledger, delta)
    errors_csv = ErrorsCsv.append(errors_csv, rejected)
    emit_rejections(rejected, file, ctx)

    Events.emit(ctx.run_id, LoadProgress,
      path: file.path,
      rows_inserted: ledger.rows_inserted,
      rows_rejected: ledger.rows_rejected
    )

    if threshold_tripped?(ledger, ctx.config.error_policy) do
      {:halt, {:threshold, ledger, errors_csv}}
    else
      {:cont, {ledger, errors_csv}}
    end
  end

  defp accumulate({:ok, {kind, %Error{} = error}}, {ledger, errors_csv}, _file, _ctx)
       when kind in [:file_error, :run_abort] do
    {:halt, {kind, error, ledger, errors_csv}}
  end

  defp accumulate({:exit, reason}, {ledger, errors_csv}, file, _ctx) do
    {:halt, {:file_error, Error.from_caught(:load, file.path, :exit, reason), ledger, errors_csv}}
  end

  defp finalize_load({ledger, errors_csv}, file, _ctx, started) do
    file = close_load(file, ledger, errors_csv, started)

    if Ledger.balanced?(ledger) do
      {:ok, file}
    else
      message =
        "ledger imbalance: read #{ledger.rows_read} != " <>
          "inserted #{ledger.rows_inserted} + rejected #{ledger.rows_rejected}"

      {:error, file, Error.file_error(:load, file.path, :ledger_mismatch, message)}
    end
  end

  defp finalize_load({:threshold, ledger, errors_csv}, file, ctx, started) do
    file = close_load(file, ledger, errors_csv, started)
    policy = ctx.config.error_policy
    percent = Float.round(ledger.rows_rejected * 100 / max(ledger.rows_read, 1), 1)

    message =
      "#{percent}% of rows rejected (threshold #{policy.row_error_threshold_pct}%) " <>
        "after #{ledger.rows_read} rows; #{ledger.rows_inserted} rows were inserted " <>
        "before stopping"

    {:error, file, Error.file_error(:load, file.path, :rejection_threshold_exceeded, message)}
  end

  defp finalize_load({:file_error, error, ledger, errors_csv}, file, _ctx, started) do
    {:error, close_load(file, ledger, errors_csv, started), error}
  end

  defp finalize_load({:run_abort, error, ledger, errors_csv}, file, ctx, started) do
    # Everything is about to fail the same way — halt the whole run with
    # one honest cause instead of N identical per-file failures.
    Server.fail_run(ctx.run_id, error)
    {:error, close_load(file, ledger, errors_csv, started), error}
  end

  defp close_load(file, ledger, errors_csv, started) do
    %{file | ledger: ledger, errors_csv: ErrorsCsv.path(errors_csv)}
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

  # The original CSV headers (ordering column excluded) — errors.csv rows
  # mirror the source file so they can be fixed and re-imported.
  defp csv_headers(file) do
    file.columns
    |> Enum.reject(&(&1.name == Resolve.ordering_column()))
    |> Enum.map(& &1.original_name)
  end

  defp update(ctx, file), do: Server.file_update(ctx.run_id, file)
end
