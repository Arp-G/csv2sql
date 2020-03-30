measure = fn function ->
  time =
    function
    |> :timer.tc()
    |> elem(0)
    |> Kernel./(1_000_000)

  "#{IO.ANSI.bright()} Operation took: #{time} seconds #{IO.ANSI.bright()}"
  |> IO.ANSI.format()
  |> IO.puts()
end

formatting = "#{IO.ANSI.underline()}  #{IO.ANSI.italic()}"

[
  :yellow_background,
  :black,
  "\n #{formatting} Welcome to IEX shell ! #{formatting} \n"
]
|> IO.ANSI.format()
|> IO.puts()
