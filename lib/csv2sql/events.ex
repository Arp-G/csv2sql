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

  defmodule FileUpdated do
    @moduledoc """
    A file's full state changed (status transitions always broadcast;
    progress-only changes are throttled by `Run.Server`). The UI's
    primary per-file event.
    """
    @enforce_keys [:run_id, :at, :file]
    defstruct [:run_id, :at, :file]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), file: Csv2sql.File.t()}
  end

  defmodule PreflightCheck do
    @moduledoc "One preflight check finished."
    @enforce_keys [:run_id, :at, :check]
    defstruct [:run_id, :at, :check]

    @type t :: %__MODULE__{run_id: String.t(), at: DateTime.t(), check: struct()}
  end

  defmodule ValidationResult do
    @moduledoc "One validation layer finished for a file (report-only)."
    @enforce_keys [:run_id, :at, :path, :layer, :status, :detail]
    defstruct [:run_id, :at, :path, :layer, :status, :detail]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            layer: atom(),
            status: atom(),
            detail: map()
          }
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

  defmodule ChunkRetried do
    @moduledoc "A chunk insert hit a transient/connection error and is being retried."
    @enforce_keys [:run_id, :at, :path, :attempt, :reason]
    defstruct [:run_id, :at, :path, :attempt, :reason]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            attempt: pos_integer(),
            reason: String.t()
          }
  end

  defmodule RowsRejected do
    @moduledoc "Rows were rejected (cast failure or per-row DB rejection) into errors.csv."
    @enforce_keys [:run_id, :at, :path, :count, :sample_reasons]
    defstruct [:run_id, :at, :path, :count, :sample_reasons]

    @type t :: %__MODULE__{
            run_id: String.t(),
            at: DateTime.t(),
            path: String.t(),
            count: pos_integer(),
            sample_reasons: [String.t()]
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
          | PreflightCheck.t()
          | ValidationResult.t()
          | FileDiscovered.t()
          | FileUpdated.t()
          | AnalyzeStarted.t()
          | AnalyzeCompleted.t()
          | SchemaCreated.t()
          | LoadProgress.t()
          | ChunkRetried.t()
          | RowsRejected.t()
          | FileCompleted.t()
          | FileFailed.t()
          | RunCompleted.t()
          | RunFailed.t()
          | RunCancelled.t()

  @terminal [RunCompleted, RunFailed, RunCancelled]
  @lifecycle [RunStarted | @terminal]
  @runs_topic "csv2sql:runs"

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
  Subscribes to run *lifecycle* events across all runs (`RunStarted` +
  terminals) — used by overview pages listing runs.
  """
  @spec subscribe_runs() :: :ok | {:error, term()}
  def subscribe_runs, do: PubSub.subscribe(@pubsub, @runs_topic)

  @doc """
  Builds and broadcasts an event.

      Events.emit(run_id, AnalyzeStarted, path: file.path)

  The `run_id` and `at` fields are filled in automatically. Lifecycle
  events additionally broadcast on the global runs topic.
  """
  @spec emit(String.t(), module(), Keyword.t()) :: :ok
  def emit(run_id, event_module, fields \\ []) do
    event = struct!(event_module, [run_id: run_id, at: DateTime.utc_now()] ++ fields)
    PubSub.broadcast(@pubsub, topic(run_id), event)

    if event_module in @lifecycle do
      PubSub.broadcast(@pubsub, @runs_topic, event)
    end

    :ok
  end

  @doc "Whether an event is terminal (no further events will follow)."
  @spec terminal?(event()) :: boolean()
  def terminal?(%module{}), do: module in @terminal
end
