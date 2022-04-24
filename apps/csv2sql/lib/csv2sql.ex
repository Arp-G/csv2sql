defmodule Csv2sql do
  def start(args) do
    # Start supervision tree
    {:ok, _sup_pid} = Csv2sql.Application.start(:no_args, :no_args)
  end
end
