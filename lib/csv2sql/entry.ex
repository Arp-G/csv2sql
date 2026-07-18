defmodule Csv2sql.Entry do
  @moduledoc """
  Binary-mode dispatch, run as the last child of the application when
  `:boot_entry` is set (prod releases / the Burrito binary):

    * `csv2sql import|analyze|--help|--version …` → run the CLI and halt
      with its exit code (the endpoint is not serving in CLI mode).
    * no arguments → GUI mode: print the URL and open the browser.

  Development (`mix phx.server`) and tests never start this.
  """

  require Logger

  alias Burrito.Util.Args

  @doc "Runs the dispatch; used as a Task child."
  @spec boot() :: :ok
  def boot do
    case argv() do
      [command | _rest] = args
      when command in ~w(import analyze --help -h --version -v) ->
        args |> Csv2sql.Cli.main() |> System.halt()

      _gui ->
        open_gui()
    end

    :ok
  end

  defp argv do
    Args.argv()
  rescue
    _not_in_burrito -> System.argv()
  catch
    _, _ -> System.argv()
  end

  defp open_gui do
    port =
      :csv2sql
      |> Application.get_env(Csv2sqlWeb.Endpoint, [])
      |> get_in([:http, :port]) || 4000

    url = "http://localhost:#{port}"
    IO.puts("csv2sql is running at #{url} (Ctrl-C to stop)")
    open_browser(url)
  end

  defp open_browser(url) do
    {command, args} =
      case :os.type() do
        {:unix, :darwin} -> {"open", [url]}
        {:win32, _} -> {"cmd", ["/c", "start", url]}
        {:unix, _} -> {"xdg-open", [url]}
      end

    System.cmd(command, args, stderr_to_stdout: true)
  rescue
    error -> Logger.warning("could not open browser: #{Exception.message(error)}")
  end
end
