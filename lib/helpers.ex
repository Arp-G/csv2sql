defmodule Csv2sql.Helper do
  def print_msg(msg, color \\ :blue) do
    color = if color == :green, do: IO.ANSI.green(), else: IO.ANSI.blue()

    color
    |> Kernel.<>("#{IO.ANSI.bright()}" <> msg <> "#{IO.ANSI.bright()}")
    |> IO.ANSI.format()
    |> IO.puts()
  end
end
