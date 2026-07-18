defmodule Csv2sql.DoctestTest do
  use ExUnit.Case, async: true

  doctest Csv2sql.Config.Db
  doctest Csv2sql.Load.Chunker
  doctest Csv2sql.Load.Encoder
  doctest Csv2sql.Schema.ColumnSpec
  doctest Csv2sql.Schema.Inference
  doctest Csv2sql.Schema.Resolve
  doctest Csv2sql.Schema.TypeCheck
  doctest Csv2sql.TimeParse
  doctest Csv2sql.TimeParse.Pattern
  doctest Csv2sql.Validate.Ledger
end
