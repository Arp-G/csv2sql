defmodule Csv2sql.Types do
  @moduledoc """
    Common typespecs type definations
  """

  defmacro __using__(_opts) do
    quote do
      @type type_map() :: %{
              is_empty: boolean(),
              is_date: boolean(),
              is_datetime: boolean(),
              is_boolean: boolean(),
              is_integer: boolean(),
              is_float: boolean(),
              is_text: boolean()
            }

      @type csv_col_types_list() :: list({String.t(), String.t()})
    end
  end
end
