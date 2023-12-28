# defmodule Csv2sql.ImportValidator do
#   alias NimbleCSV.RFC4180, as: CSV
#   alias Csv2sql.Helpers

#   @doc """
#   Validates import by comparing row count in csv vs row count in database
#   """
#   def validate_import(file_list) do
#     %{stats: {total, correct, incorrect}, incorrect_files: incorrect_files} =
#       file_list
#       |> Enum.reduce(
#         %{stats: {0, 0, 0}, incorrect_files: []},
#         fn {_file_path, %Csv2sql.File{name: file, row_count: row_count}},
#            %{stats: {total, correct, incorrect}, incorrect_files: incorrect_files} ->
#           Helpers.print_msg("Checking File: #{Path.basename(file)}", :yellow)

#           main_server_config = Application.get_env(:csv2sql, Csv2sql.MainServer)

#           src =
#             if Application.get_env(:csv2sql, Csv2sql.Worker)[:set_insert_data],
#               do: main_server_config[:imported_csv_directory],
#               else: main_server_config[:source_csv_directory]

#           result =
#             if validate_csv(file, row_count) do
#               File.rename(
#                 "#{src}/#{file}.csv",
#                 "#{main_server_config[:validated_csv_directory]}/#{file}.csv"
#               )

#               %{
#                 stats: {total + 1, correct + 1, incorrect},
#                 incorrect_files: incorrect_files
#               }
#             else
#               %{
#                 stats: {total + 1, correct, incorrect + 1},
#                 incorrect_files: incorrect_files ++ [file]
#               }
#             end

#           result
#         end
#       )

#     show_validation_results(total, correct, incorrect, incorrect_files)
#     {incorrect, incorrect_files}
#   end

#   @doc """
#   Get row count in csv file
#   """
#   def get_count_from_csv(file) do
#     file
#     |> File.stream!()
#     |> CSV.parse_stream()
#     |> Enum.count()
#   end

#   defp validate_csv(file, row_count) do
#     db_count = get_db_count(file)

#     white = IO.ANSI.white()

#     Helpers.print_msg("Count in csv: #{white}#{row_count}")
#     Helpers.print_msg("Count in database:  #{white}#{db_count}")

#     if row_count == db_count do
#       """
#       Correct !

#       """
#       |> Helpers.print_msg(:green)

#       true
#     else
#       """
#       Incorrect !

#       """
#       |> Helpers.print_msg(:red)

#       false
#     end
#   end

#   defp get_db_count(file) do
#     table_name =
#       file
#       |> Path.basename()
#       |> String.trim_trailing(".csv")

#     require Ecto.Query

#     try do
#       Ecto.Query.from(p in table_name, select: count("*"))
#       |> Csv2sql.get_repo().one(
#         prefix:
#           if(Csv2sql.get_db_type() == :mysql,
#             do: Application.get_env(:csv2sql, Csv2sql.get_repo())[:database_name]
#           )
#       )
#     catch
#       _, _ ->
#         Helpers.print_msg("An exception occured !", :red)
#         "#{IO.ANSI.red()}✗#{IO.ANSI.reset()}"
#         -1
#     end
#   end

#   defp show_validation_results(total, correct, incorrect, incorrect_files) do
#     """

#     #{IO.ANSI.underline()}Validation Completed:#{IO.ANSI.no_underline()}

#     """
#     |> Helpers.print_msg(:white)

#     white = IO.ANSI.white()

#     Helpers.print_msg("* Number of files checked: #{white}#{total}")
#     Helpers.print_msg("* Number of files with correct count: #{white}#{correct}")
#     Helpers.print_msg("* Number of files with incorrect count: #{white}#{incorrect}")

#     if incorrect > 0 do
#       """

#       Files with incorrect count:
#       """
#       |> Helpers.print_msg(:white)

#       incorrect_files
#       |> Enum.each(fn file ->
#         Helpers.print_msg("* #{Path.basename(file)}", :red)
#       end)
#     end
#   end
# end
