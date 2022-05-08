defmodule Csv2sql.Helpers do
  @moduledoc """
    Common Helper functions
  """
  @spec get_config(any) :: any
  def get_config(key), do: Application.get_env(:csv2sql, :config) |> Map.get(key)

  @spec get_csv_headers(binary) :: list(String.t())
  def get_csv_headers(file_path) when is_binary(file_path) do
    [headers] =
      file_path
      |> File.stream!()
      |> Stream.take(1)
      |> NimbleCSV.RFC4180.parse_stream(skip_headers: false)
      |> Enum.to_list()

    headers
  end
end
