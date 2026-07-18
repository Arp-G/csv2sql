defmodule Csv2sql.Error do
  @moduledoc """
  A structured error flowing through events, run state, and reports.

  Errors carry *where* (stage, file, row range), *what* (reason, message),
  and *how to react* (class, retriable?) — the UI and CLI render them
  without ever needing a raw stacktrace or log dive.

  Classes:

    * `:preflight` — configuration/environment problems that block a run
    * `:run` — unrecoverable run-level failures (halts the run gracefully)
    * `:file` — one file failed; sibling files continue
    * `:row` — specific rows were rejected; the file continues
    * `:transient` — retriable infrastructure hiccups (retried with backoff)

  """

  use Ecto.Schema

  @stages [:preflight, :discover, :parse, :analyze, :ddl, :load, :validate, :report]
  @classes [:preflight, :run, :file, :row, :transient]

  @primary_key false
  embedded_schema do
    field(:stage, Ecto.Enum, values: @stages)
    field(:class, Ecto.Enum, values: @classes)
    field(:file, :string)
    field(:reason, :string)
    field(:message, :string)
    field(:detail, :map, default: %{})
    field(:row_start, :integer)
    field(:row_end, :integer)
    field(:retriable, :boolean, default: false)
    field(:adapter_code, :string)
  end

  @type stage :: :preflight | :discover | :parse | :analyze | :ddl | :load | :validate | :report
  @type class :: :preflight | :run | :file | :row | :transient

  @type t :: %__MODULE__{
          stage: stage() | nil,
          class: class() | nil,
          file: String.t() | nil,
          reason: String.t() | nil,
          message: String.t() | nil,
          detail: map(),
          row_start: non_neg_integer() | nil,
          row_end: non_neg_integer() | nil,
          retriable: boolean(),
          adapter_code: String.t() | nil
        }

  @doc "Builds a file-class error."
  @spec file_error(stage(), Path.t(), atom() | String.t(), String.t(), Keyword.t()) :: t()
  def file_error(stage, file, reason, message, opts \\ []) do
    struct!(
      %__MODULE__{
        stage: stage,
        class: :file,
        file: to_string(file),
        reason: to_string(reason),
        message: message
      },
      opts
    )
  end

  @doc "Builds a run-class error."
  @spec run_error(stage(), atom() | String.t(), String.t(), Keyword.t()) :: t()
  def run_error(stage, reason, message, opts \\ []) do
    struct!(
      %__MODULE__{stage: stage, class: :run, reason: to_string(reason), message: message},
      opts
    )
  end

  @doc "Wraps a raised exception into a file-class error."
  @spec from_exception(stage(), Path.t() | nil, Exception.t()) :: t()
  def from_exception(stage, file, exception) when is_exception(exception) do
    %__MODULE__{
      stage: stage,
      class: :file,
      file: file && to_string(file),
      reason: exception |> exception_name() |> to_string(),
      message: Exception.message(exception)
    }
  end

  @doc "Wraps an arbitrary caught value (`{kind, payload}`) into an error."
  @spec from_caught(stage(), Path.t() | nil, atom(), term()) :: t()
  def from_caught(stage, file, _kind, %{__exception__: true} = exception),
    do: from_exception(stage, file, exception)

  def from_caught(stage, file, kind, payload) do
    %__MODULE__{
      stage: stage,
      class: :file,
      file: file && to_string(file),
      reason: to_string(kind),
      message: inspect(payload)
    }
  end

  defp exception_name(%name{}), do: name |> Module.split() |> List.last() |> Macro.underscore()
end
