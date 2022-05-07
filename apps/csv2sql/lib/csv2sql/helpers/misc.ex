defmodule Csv2sql.Helpers.Misc do
  @moduledoc """
  Miscellaneous helpers
  """
  def get_config(key), do: Application.get_env(:csv2sql, :config) |> Map.get(key)
end
