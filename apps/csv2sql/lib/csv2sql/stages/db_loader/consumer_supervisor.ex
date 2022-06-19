defmodule Csv2sql.DbLoader.ConsumerSupervisor do
  use ConsumerSupervisor
  alias Csv2sql.DbLoader

  def start_link() do
    ConsumerSupervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_args) do
    children = [
      %{
        id: DbLoader.Consumer,
        start: {DbLoader.Consumer, :start_link, []},
        restart: :transient
      }
    ]

    ConsumerSupervisor.init(children, strategy: :one_for_one)
  end
end
