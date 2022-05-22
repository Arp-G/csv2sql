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

  # Warning: Timezone information if any will be ignored while parsing datetime
  @spec format_datetime(String.t(), boolean()) :: DateTime.t() | NaiveDateTime.t() | nil
  def format_datetime(datetime, is_date) do
    if(is_date, do: :date_patterns, else: :datetime_patterns)
    |> get_config()
    |> Enum.find_value(fn pattern ->
      case Timex.parse(datetime, pattern) do
        {:ok, %DateTime{} = datetime} ->
          to_date_or_datetime_string(datetime, is_date)

        {:ok, %NaiveDateTime{} = native_datetime} ->
          native_datetime
          |> DateTime.from_naive!("Etc/UTC")
          |> to_date_or_datetime_string(is_date)

        {:error, _} ->
          # TODO: Log date time parse faliure
          nil
      end
    end)
  end

  defp to_date_or_datetime_string(datetime, true),
    do: datetime |> DateTime.to_date() |> Date.to_string() |> String.trim_trailing("Z")

  defp to_date_or_datetime_string(datetime, false),
    do: datetime |> DateTime.to_string() |> String.trim_trailing("Z")
end
