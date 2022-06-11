defmodule Csv2sql.ProgressTracker.State do
  @moduledoc """
    Progress tracker state struct defination for csv2sql
  """
  use Csv2sql.Types
  use TypedStruct

  typedstruct enforce: true do
    @typedoc "Csv2sql progress tracker struct"

    field :start_time, DateTime.t()
    field :end_time, DateTime.t(), enforce: false
    field :files, files_map(), default: %{}
    field :status, :init | :working | :finish | {:error, String.t()}, default: :init
    field :subscribers, list(pid()), default: []
  end
end
