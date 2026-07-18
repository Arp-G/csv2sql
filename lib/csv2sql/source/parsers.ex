NimbleCSV.define(Csv2sql.Source.Parsers.Semicolon, separator: ";", escape: "\"")
NimbleCSV.define(Csv2sql.Source.Parsers.Tab, separator: "\t", escape: "\"")
NimbleCSV.define(Csv2sql.Source.Parsers.Pipe, separator: "|", escape: "\"")

defmodule Csv2sql.Source.Parsers do
  @moduledoc """
  Compile-time NimbleCSV parsers, one per supported delimiter.
  """

  @type delimiter :: :comma | :semicolon | :tab | :pipe

  @modules %{
    comma: NimbleCSV.RFC4180,
    semicolon: Csv2sql.Source.Parsers.Semicolon,
    tab: Csv2sql.Source.Parsers.Tab,
    pipe: Csv2sql.Source.Parsers.Pipe
  }

  @doc "The parser module for a delimiter."
  @spec module(delimiter()) :: module()
  def module(delimiter), do: Map.fetch!(@modules, delimiter)

  @doc "The delimiter character for sniffing."
  @spec char(delimiter()) :: String.t()
  def char(:comma), do: ","
  def char(:semicolon), do: ";"
  def char(:tab), do: "\t"
  def char(:pipe), do: "|"

  @doc "All supported delimiters."
  @spec all() :: [delimiter()]
  def all, do: [:comma, :semicolon, :tab, :pipe]
end
