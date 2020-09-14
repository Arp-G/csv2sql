defmodule Csv2sql.ImportValidator do
  alias NimbleCSV.RFC4180, as: CSV
  alias Csv2sql.Helpers

  def validate_import(path) do
    %{stats: {total, correct, incorrect}, incorrect_files: incorrect_files} =
      Path.wildcard("#{path}/*.csv")
      |> Enum.reduce(
        %{stats: {0, 0, 0}, incorrect_files: []},
        fn file, %{stats: {total, correct, incorrect}, incorrect_files: incorrect_files} ->
          Helpers.print_msg("Checking File: #{Path.basename(file)}", :yellow)

          result =
            if validate_csv(file) do
              %{
                stats: {total + 1, correct + 1, incorrect},
                incorrect_files: incorrect_files
              }
            else
              %{
                stats: {total + 1, correct, incorrect + 1},
                incorrect_files: incorrect_files ++ [file]
              }
            end

          validated_csv_directory =
            Application.get_env(:csv2sql, Csv2sql.MainServer)[:validated_csv_directory]

          File.rename!(file, "#{validated_csv_directory}/#{Path.basename(file)}")
          result
        end
      )

    """

    #{IO.ANSI.underline()}Validation Completed:#{IO.ANSI.no_underline()}

    """
    |> Helpers.print_msg(:white)

    white = IO.ANSI.white()

    Helpers.print_msg("* Number of files checked: #{white}#{total}")
    Helpers.print_msg("* Number of files with correct count: #{white}#{correct}")
    Helpers.print_msg("* Number of files with incorrect count: #{white}#{incorrect}")

    if incorrect > 0 do
      """


      Files with incorrect count:
      """
      |> Helpers.print_msg(:white)

      incorrect_files
      |> Enum.each(fn file ->
        Helpers.print_msg("* #{Path.basename(file)}", :red)
      end)
    end
  end

  defp validate_csv(file) do
    csv_count = get_count_from_csv(file)
    db_count = get_db_count(file)

    white = IO.ANSI.white()

    Helpers.print_msg("Count in csv: #{white}#{csv_count}")
    Helpers.print_msg("Count in database:  #{white}#{db_count}")

    if csv_count == db_count do
      """
      Correct !

      """
      |> Helpers.print_msg(:green)

      true
    else
      """
      Incorrect !

      """
      |> Helpers.print_msg(:red)

      false
    end
  end

  defp get_count_from_csv(file) do
    file
    |> File.stream!()
    |> CSV.parse_stream()
    |> Enum.count()
  end

  defp get_db_count(file) do
    database_name = Application.get_env(:csv2sql, Csv2sql.Repo)[:database_name]

    table_name =
      file
      |> Path.basename()
      |> String.trim_trailing(".csv")

    require Ecto.Query

    try do
      Ecto.Query.from(p in table_name, select: count("*"))
      |> Csv2sql.Repo.one(prefix: database_name)
    rescue
      MyXQL.Error ->
        Helpers.print_msg("An exception occured !", :red)
        "#{IO.ANSI.red()}✗#{IO.ANSI.reset()}"
    end
  end
end
