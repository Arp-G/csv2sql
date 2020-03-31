measure = fn function ->
  time =
    function
    |> :timer.tc()
    |> elem(0)
    |> Kernel./(1_000_000)

  IO.ANSI.green()
  |> Kernel.<>("#{IO.ANSI.bright()} Operation took: #{time} seconds #{IO.ANSI.bright()}")
  |> IO.ANSI.format()
  |> IO.puts()
end
