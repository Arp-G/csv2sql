defmodule Csv2sql.Events do
  @moduledoc """
  The typed event bus.

  Every stage of a run broadcasts structured events on a per-run
  `Phoenix.PubSub` topic. The LiveView UI, the CLI reporter, the report
  writer, and the test harness are all plain subscribers of the same bus —
  there is no other progress/error side channel.

  Events are always structs (never raw maps) and always carry `run_id`
  and an `at` timestamp.
  """

  alias Phoenix.PubSub

  @pubsub Csv2sql.PubSub

  defmodule RunStarted do
    @moduledoc "A run has been accepted and its files discovered."
    @enforce_keys [:run_id, :at, :file_count]
    defstruct [:run_id, :at, :file_count]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), file_count: non_neg_integer()}
  end

  defmodule FileDiscovered do
    @moduledoc "A CSV file was found in the source directory."
    @enforce_keys [:run_id, :at, :file]
    defstruct [:run_id, :at, :file]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), file: Csv2sql.File.t()}
  end

  defmodule AnalyzeStarted do
    @moduledoc "Type inference started for a file."
    @enforce_keys [:run_id, :at, :path]
    defstruct [:run_id, :at, :path]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), path: String.t()}
  end

  defmodule AnalyzeCompleted do
    @moduledoc "Type inference finished; the schema is known."
    @enforce_keys [:run_id, :at, :path, :row_count, :columns]
    defstruct [:run_id, :at, :path, :row_count, :columns]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            row_count: non_neg_integer(),
            columns: [Csv2sql.Schema.ColumnSpec.t()]
          }
  end

  defmodule SchemaCreated do
    @moduledoc "The target table was (re)created."
    @enforce_keys [:run_id, :at, :path, :table, :ddl]
    defstruct [:run_id, :at, :path, :table, :ddl]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            table: String.t(),
            ddl: String.t()
          }
  end

  defmodule LoadProgress do
    @moduledoc "Cumulative load progress for one file."
    @enforce_keys [:run_id, :at, :path, :rows_inserted, :rows_rejected]
    defstruct [:run_id, :at, :path, :rows_inserted, :rows_rejected]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            rows_inserted: non_neg_integer(),
            rows_rejected: non_neg_integer()
          }
  end

  defmodule FileCompleted do
    @moduledoc "A file finished successfully (imported or analyzed)."
    @enforce_keys [:run_id, :at, :path, :ledger, :timings]
    defstruct [:run_id, :at, :path, :ledger, :timings]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            ledger: Csv2sql.Validate.Ledger.t(),
            timings: map()
          }
  end

  defmodule FileFailed do
    @moduledoc "A file failed; sibling files continue."
    @enforce_keys [:run_id, :at, :path, :error]
    defstruct [:run_id, :at, :path, :error]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            error: Csv2sql.Error.t()
          }
  end

  defmodule RunCompleted do
    @moduledoc "Terminal: the run finished (possibly with per-file errors)."
    @enforce_keys [:run_id, :at, :summary]
    defstruct [:run_id, :at, :summary]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), summary: Csv2sql.Run.Summary.t()}
  end

  defmodule RunFailed do
    @moduledoc "Terminal: the run aborted on an unrecoverable error."
    @enforce_keys [:run_id, :at, :error]
    defstruct [:run_id, :at, :error]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), error: Csv2sql.Error.t()}
  end

  defmodule RunCancelled do
    @moduledoc "Terminal: the run was cancelled by the user."
    @enforce_keys [:run_id, :at]
    defstruct [:run_id, :at]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t()}
  end

  @type event ::
          RunStarted.t()
          | FileDiscovered.t()
          | AnalyzeStarted.t()
          | AnalyzeCompleted.t()
          | SchemaCreated.t()
          | LoadProgress.t()
          | FileCompleted.t()
          | FileFailed.t()
          | RunCompleted.t()
          | RunFailed.t()
          | RunCancelled.t()

  @terminal [RunCompleted, RunFailed, RunCancelled]

  @doc "The PubSub topic for a run."
  @spec topic(String.t()) :: String.t()
  def topic(run_id), do: "csv2sql:run:" <> run_id

  @doc "Subscribes the calling process to a run's events."
  @spec subscribe(String.t()) :: :ok | {:error, term()}
  def subscribe(run_id), do: PubSub.subscribe(@pubsub, topic(run_id))

  @doc "Unsubscribes the calling process from a run's events."
  @spec unsubscribe(String.t()) :: :ok
  def unsubscribe(run_id), do: PubSub.unsubscribe(@pubsub, topic(run_id))

  @doc """
  Builds and broadcasts an event.

      Events.emit(run_id, AnalyzeStarted, path: file.path)

  The `run_id` and `at` fields are filled in automatically.
  """
  @spec emit(String.t(), module(), Keyword.t()) :: :ok
  def emit(run_id, event_module, fields \\ []) do
    event = struct!(event_module, [run_id: run_id, at: DateTime.utc_now()] ++ fields)
    PubSub.broadcast(@pubsub, topic(run_id), event)
  end

  @doc "Whether an event is terminal (no further events will follow)."
  @spec terminal?(event()) :: boolean()
  def terminal?(%module{}), do: module in @terminal
end
