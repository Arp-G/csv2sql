defmodule Csv2sql.Helpers do
  def print_msg(msg, color \\ :blue) do
    color =
      case color do
        :blue -> IO.ANSI.blue()
        :green -> IO.ANSI.green()
        :red -> IO.ANSI.red()
        :yellow -> IO.ANSI.yellow()
        _ -> IO.ANSI.white()
      end

    color
    |> Kernel.<>("#{IO.ANSI.bright()}" <> msg <> "#{IO.ANSI.bright()}")
    |> IO.ANSI.format()
    |> IO.puts()
  end

  def animation_wrapper(args, mod, func, start_text \\ "Processing...", end_text \\ "Done !") do
    start_text = """
    #{IO.ANSI.blue()}#{start_text}

    """

    end_text = """
    #{IO.ANSI.green()}#{end_text}

    """

    CliSpinners.spin_fun(
      [
        frames: :clock,
        text: start_text,
        done: end_text
      ],
      fn -> apply(mod, func, [args]) end
    )
  end

  def greet() do
    (IO.ANSI.clear() <>
       IO.ANSI.green() <>
       IO.ANSI.bright() <>
       """



         .oooooo.    .oooooo..o oooooo     oooo      .oooo.       .oooooo..o   .oooooo.      ooooo
        d8P'  `Y8b  d8P'    `Y8  `888.     .8'     .dP""Y88b     d8P'    `Y8  d8P'  `Y8b     `888'
       888          Y88bo.        `888.   .8'            ]8P'    Y88bo.      888      888     888
       888           `"Y8888o.     `888. .8'           .d8P'      `"Y8888o.  888      888     888
       888               `"Y88b     `888.8'          .dP'             `"Y88b 888      888     888
       `88b    ooo  oo     .d8P      `888'         .oP     .o    oo     .d8P `88b    d88b     888       o
        `Y8bood8P'  88888888P'        `8'          8888888888    88888888P'   `Y8bood8P'Ybd' o888ooooood8


       """)
    |> IO.puts()

    start_text = [:yellow_background, :black, " Starting... !"] |> IO.ANSI.format()

    CliSpinners.spin_fun(
      [
        frames: :arrow3,
        text: start_text,
        done: ""
      ],
      fn -> :timer.sleep(5000) end
    )
  end
end
