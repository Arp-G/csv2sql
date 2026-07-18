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
    SchemaCreated
  }

  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Load.Encoder
  alias Csv2sql.Run.Server
  alias Csv2sql.Schema.Inference
  alias Csv2sql.Schema.Resolve
  alias Csv2sql.Source.Reader
  alias Csv2sql.Validate.Ledger

  @type ctx :: %{
          run_id: String.t(),
          config: Config.t(),
          adapter: module(),
          conn: Csv2sql.Adapter.conn()
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
        file
    end
  end

  # -- Pass 1: analyze --------------------------------------------------------

  defp analyze(file, ctx) do
    update(ctx, %{file | status: :analyzing})
    Events.emit(ctx.run_id, AnalyzeStarted, path: file.path)
    started = System.monotonic_time(:millisecond)

    case Reader.headers!(file.path) do
      [] ->
        {:error, file, Error.file_error(:parse, file.path, :empty_file, "file has no header row")}

      headers ->
        column_count = length(headers)

        acc =
          file.path
          |> Reader.data_stream()
          |> Stream.chunk_every(ctx.config.analyze_chunk_rows)
          |> Task.async_stream(&Inference.chunk_stats(&1, column_count),
            max_concurrency: ctx.config.file_workers,
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
    exception in NimbleCSV.ParseError ->
      {:error, file, Error.from_exception(:parse, file.path, exception)}

    exception ->
      {:error, file, Error.from_exception(:analyze, file.path, exception)}
  end

  # -- DDL + Pass 2: load -----------------------------------------------------

  defp maybe_import(file, %{config: %Config{mode: :analyze}} = ctx) do
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

    drop_sql = IO.iodata_to_binary(ctx.adapter.drop_table_sql(file.table_name))
    create_sql = IO.iodata_to_binary(ctx.adapter.create_table_sql(file.table_name, file.columns))

    statements =
      case ctx.config.table_mode do
        :drop -> [drop_sql, create_sql]
        :append -> [create_sql]
      end

    case run_statements(ctx, statements) do
      :ok ->
        file = CsvFile.put_timing(file, :ddl_ms, System.monotonic_time(:millisecond) - started)

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

    ledger =
      file.path
      |> Reader.data_stream()
      |> Stream.chunk_every(ctx.config.insert_chunk_rows)
      |> Task.async_stream(&insert_chunk(&1, file, ctx),
        max_concurrency: ctx.config.insert_workers,
        ordered: false,
        timeout: :infinity
      )
      |> Enum.reduce(Ledger.new(), fn {:ok, delta}, acc ->
        acc = Ledger.merge(acc, delta)

        Events.emit(ctx.run_id, LoadProgress,
          path: file.path,
          rows_inserted: acc.rows_inserted,
          rows_rejected: acc.rows_rejected
        )

        acc
      end)

    file =
      %{file | ledger: ledger}
      |> CsvFile.put_timing(:load_ms, System.monotonic_time(:millisecond) - started)

    if Ledger.balanced?(ledger) do
      {:ok, file}
    else
      message =
        "ledger imbalance: read #{ledger.rows_read} != " <>
          "inserted #{ledger.rows_inserted} + rejected #{ledger.rows_rejected}"

      {:error, file, Error.file_error(:load, file.path, :ledger_mismatch, message)}
    end
  rescue
    exception -> {:error, file, Error.from_exception(:load, file.path, exception)}
  end

  defp insert_chunk(rows, file, ctx) do
    {reversed_encoded, rejected} =
      Enum.reduce(rows, {[], 0}, fn row, {encoded, rejected} ->
        case Encoder.encode_row(row, file.columns) do
          {:ok, encoded_row} -> {[encoded_row | encoded], rejected}
          # Rejected-row reasons feed <file>.errors.csv in the error-model stage.
          {:error, _reason} -> {encoded, rejected + 1}
        end
      end)

    encoded = Enum.reverse(reversed_encoded)

    case ctx.adapter.insert_rows(ctx.conn, file.table_name, file.columns, encoded) do
      {:ok, inserted} ->
        %Ledger{
          rows_read: length(rows),
          rows_inserted: inserted,
          rows_rejected: rejected,
          chunks_ok: 1
        }

      {:error, exception} ->
        # Row-isolation retry lands in the error-model stage; for now an
        # insert failure fails the file (crash propagates to the file task).
        raise exception
    end
  end

  defp update(ctx, file), do: Server.file_update(ctx.run_id, file)
end
