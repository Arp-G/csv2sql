defmodule Csv2sql.File do
  use Csv2sql.Types

  @moduledoc """
    A file struct that contains information about a csv file
  """
  use TypedStruct

  typedstruct enforce: true do
    @typedoc "Csv2sql File struct"

    field(:name, String.t())
    field(:path, String.t())
    field(:size, non_neg_integer(), default: 0)
    field(:row_count, non_neg_integer(), default: 0)
    field(:rows_processed, non_neg_integer(), default: 0)
    field(:column_types, csv_col_types_list(), enforce: false)
    field(:status, file_status(), default: :pending)
  end
end
