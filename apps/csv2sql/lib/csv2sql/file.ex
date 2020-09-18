defmodule Csv2sql.File do
  defstruct name: "", path: "", raw_size: 0, humanised_size: "", row_count: 0, status: :pending
end
