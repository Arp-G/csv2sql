defmodule Csv2sql.Loader.ConsumerSupervisor do
  use ConsumerSupervisor

  def start_link() do
    ConsumerSupervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_args) do
    children = [
      %{
        id: Csv2sql.Loader.Consumer,
        start: {Csv2sql.Loader.Consumer, :start_link, []},
        restart: :transient
      }
    ]

    opts = [strategy: :one_for_one]

    ConsumerSupervisor.init(children, opts)
  end
end
