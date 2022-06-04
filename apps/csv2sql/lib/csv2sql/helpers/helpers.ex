defmodule Csv2sql.Helpers do
  @moduledoc """
    Common Helper functions
  """
  import ShorterMaps

  @spec get_config(any) :: any
  def get_config(key), do: Application.get_env(:csv2sql, :config) |> Map.get(key)

  def db_access_required() do
    ~M{%Csv2sql.Config insert_schema, insert_data } = Application.get_env(:csv2sql, :config)
    insert_schema || insert_data
  end

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

  # Warning: Timezone information and milliseconds if any will be ignored while parsing datetime
  @spec format_datetime(String.t(), boolean()) :: DateTime.t() | Date.t() | nil
  def format_datetime(datetime, is_date) do
    if(is_date, do: :date_patterns, else: :datetime_patterns)
    |> get_config()
    |> Enum.find_value(fn pattern ->
      datetime
      |> Timex.parse(pattern)
      |> case do
        {:ok, %DateTime{} = datetime} ->
          datetime

        {:ok, %NaiveDateTime{} = native_datetime} ->
          DateTime.from_naive!(native_datetime, "Etc/UTC")

        {:error, _} ->
          # TODO: Log date time parse faliure
          nil
      end
      |> strip_datetime(is_date)
    end)
  end

  defp strip_datetime(~M{%DateTime year, month, day}, true),
    do: Date.new!(year, month, day, Calendar.ISO)

  defp strip_datetime(~M{%DateTime year, month, day, hour, minute, second}, false) do
    %DateTime{
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
      microsecond: {0, 0},
      time_zone: "Etc/UTC",
      zone_abbr: "UTC",
      utc_offset: 0,
      std_offset: 0
    }
  end

  defp strip_datetime(nil, _), do: nil
end
