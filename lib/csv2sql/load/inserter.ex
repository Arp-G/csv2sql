defmodule Csv2sql.Load.Inserter do
  @moduledoc """
  Inserts one chunk, handling failure **in place** — never via a retry
  queue:

    * cast failures reject rows before the database is involved
    * `:row_data` errors split the chunk row-by-row immediately to
      isolate the poison rows (a failed multi-VALUES statement inserted
      nothing, so re-sending rows can never duplicate data)
    * `:transient`/`:connection` errors retry the same statement after a
      doubling backoff, up to the configured budget
    * exhausted `:connection` errors escalate to a run abort (everything
      else is about to fail identically); `:fatal` and exhausted
      `:transient` errors fail the file

  Returns tagged results; it never raises.
  """

  alias Csv2sql.Config
  alias Csv2sql.Error
  alias Csv2sql.Events
  alias Csv2sql.Events.ChunkRetried
  alias Csv2sql.File, as: CsvFile
  alias Csv2sql.Load.Encoder
  alias Csv2sql.Validate.Fingerprint
  alias Csv2sql.Validate.Ledger

  @typedoc "A rejected row: original cells, 1-based data row number, reason."
  @type rejected :: %{row: [String.t()], row_number: pos_integer(), reason: String.t()}

  @typedoc "Ledger delta + fingerprints over the successfully inserted rows."
  @type outcome :: %{
          ledger: Ledger.t(),
          fingerprints: [Fingerprint.acc()],
          rejected: [rejected()]
        }

  @type result ::
          {:ok, outcome()}
          | {:file_error, Error.t()}
          | {:run_abort, Error.t()}

  @doc """
  Inserts a chunk of `{original_row, row_number}` tuples.

  `ctx` is the file-pipeline context (adapter, conn, config, parsers).
  """
  @spec insert_chunk([{[String.t()], pos_integer()}], CsvFile.t(), map()) :: result()
  def insert_chunk(numbered_rows, file, ctx) do
    {encoded, encode_rejects} = encode_rows(numbered_rows, file, ctx)

    encoded_terms = Enum.map(encoded, &elem(&1, 0))

    case insert_with_retry(encoded_terms, file, ctx) do
      {:ok, inserted, retries} ->
        {:ok,
         %{
           ledger: %Ledger{
             rows_read: length(numbered_rows),
             rows_inserted: inserted,
             rows_rejected: length(encode_rejects),
             chunks_ok: 1,
             retries: retries
           },
           fingerprints: Fingerprint.add_rows(Fingerprint.init(file.columns), encoded_terms),
           rejected: encode_rejects
         }}

      {:isolate, _error, retries} ->
        isolate_rows(encoded, encode_rejects, retries, numbered_rows, file, ctx)

      {:halt, kind, error, _retries} ->
        {kind, error}
    end
  end

  # -- Encoding ---------------------------------------------------------------

  defp encode_rows(numbered_rows, file, ctx) do
    {encoded, rejects} =
      Enum.reduce(numbered_rows, {[], []}, fn {row, row_number}, {encoded, rejects} ->
        insert_row = maybe_prepend_ordering(row, row_number, ctx.config)

        case Encoder.encode_row(insert_row, file.columns, ctx.parsers) do
          {:ok, terms} ->
            {[{terms, row, row_number} | encoded], rejects}

          {:error, reason} ->
            {encoded, [%{row: row, row_number: row_number, reason: reason} | rejects]}
        end
      end)

    {Enum.reverse(encoded), Enum.reverse(rejects)}
  end

  defp maybe_prepend_ordering(row, row_number, %Config{ordered: true}),
    do: [Integer.to_string(row_number) | row]

  defp maybe_prepend_ordering(row, _row_number, _config), do: row

  # -- Whole-chunk insert with retry budget -----------------------------------

  defp insert_with_retry(encoded_terms, file, ctx, attempt \\ 1, retries \\ 0)

  defp insert_with_retry([], _file, _ctx, _attempt, retries), do: {:ok, 0, retries}

  defp insert_with_retry(encoded_terms, file, ctx, attempt, retries) do
    case ctx.adapter.insert_rows(ctx.conn, file.table_name, file.columns, encoded_terms) do
      {:ok, inserted} ->
        {:ok, inserted, retries}

      {:error, error} ->
        react(
          ctx.adapter.classify_error(error),
          error,
          encoded_terms,
          file,
          ctx,
          attempt,
          retries
        )
    end
  end

  defp react(:row_data, error, _terms, _file, _ctx, _attempt, retries),
    do: {:isolate, error, retries}

  defp react(class, error, terms, file, ctx, attempt, retries)
       when class in [:transient, :connection] do
    policy = ctx.config.error_policy

    if attempt <= policy.max_retries do
      Events.emit(ctx.run_id, ChunkRetried,
        path: file.path,
        attempt: attempt,
        reason: Exception.message(error)
      )

      Process.sleep(policy.backoff_ms * Integer.pow(2, attempt - 1))
      insert_with_retry(terms, file, ctx, attempt + 1, retries + 1)
    else
      kind = if class == :connection, do: :run_abort, else: :file_error
      {:halt, kind, exhausted_error(class, error, file, attempt - 1), retries}
    end
  end

  defp react(:fatal, error, _terms, file, _ctx, _attempt, retries) do
    {:halt, :file_error, Error.from_exception(:load, file.path, error), retries}
  end

  defp exhausted_error(:connection, error, file, attempts) do
    Error.run_error(
      :load,
      :database_unreachable,
      "no database connection after #{attempts} retries: #{Exception.message(error)}",
      file: file.path,
      retriable: false
    )
  end

  defp exhausted_error(:transient, error, file, attempts) do
    Error.file_error(
      :load,
      file.path,
      :retries_exhausted,
      "still failing after #{attempts} retries: #{Exception.message(error)}"
    )
  end

  # -- Row-by-row isolation ----------------------------------------------------

  defp isolate_rows(encoded, encode_rejects, retries, numbered_rows, file, ctx) do
    initial = %{
      inserted: 0,
      rejected: encode_rejects,
      retries: retries,
      fingerprints: Fingerprint.init(file.columns)
    }

    encoded
    |> Enum.reduce_while(initial, fn {terms, row, row_number}, acc ->
      case insert_with_retry([terms], file, ctx) do
        {:ok, inserted, row_retries} ->
          {:cont,
           %{
             acc
             | inserted: acc.inserted + inserted,
               retries: acc.retries + row_retries,
               fingerprints: Fingerprint.add_rows(acc.fingerprints, [terms])
           }}

        {:isolate, error, row_retries} ->
          rejected = %{row: row, row_number: row_number, reason: Exception.message(error)}

          {:cont,
           %{
             acc
             | rejected: [rejected | acc.rejected],
               retries: acc.retries + row_retries
           }}

        {:halt, kind, error, _row_retries} ->
          {:halt, {kind, error}}
      end
    end)
    |> case do
      {kind, error} when kind in [:file_error, :run_abort] ->
        {kind, error}

      acc ->
        {:ok,
         %{
           ledger: %Ledger{
             rows_read: length(numbered_rows),
             rows_inserted: acc.inserted,
             rows_rejected: length(acc.rejected),
             chunks_isolated: 1,
             retries: acc.retries
           },
           fingerprints: acc.fingerprints,
           rejected: acc.rejected |> Enum.sort_by(& &1.row_number)
         }}
    end
  end
end
