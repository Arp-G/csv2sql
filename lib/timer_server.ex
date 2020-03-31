defmodule Csv2sql.TimerServer do
  use GenServer

  def get_time_spend() do
    GenServer.cast(__MODULE__, :get_start_time)
  end

  def start_link(start_time) do
    GenServer.start_link(__MODULE__, start_time, name: __MODULE__)
  end

  def init(start_time) do
    {:ok, start_time}
  end

  def handle_cast(:get_start_time, start_time) do
    time_taken =
      Time.utc_now()
      |> Time.diff(start_time, :millisecond)
      |> Kernel./(1000)

    """

    ----------------------------------------

    FINISHED !!!

    The operation took #{time_taken} seconds


    ----------------------------------------

    """
    |> Csv2sql.Helper.print_msg(:green)

    {:noreply, start_time}
  end
end
