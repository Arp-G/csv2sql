# repo = Csv2sql.Database.get_repo(:postgres)
# {:ok, conn} = repo.start_link( url: "ecto://postgres:postgres@localhost/crm_notification_dev")
# Csv2sql.Config.Loader.load(%{ db_type: "postgres", db_url: "postgres:postgres@localhost/csv2sql", log: false, source_directory: "/home/arpan/dev/others/csv2sql/apps/csv2sql/priv/test_csvs/" })
# Csv2sql.Config.Loader.load(%{ db_type: "mysql", db_url: "root:mysql@localhost/csv2sql", log: false, source_directory: "/home/arpan/dev/others/csv2sql/apps/csv2sql/priv/test_csvs/" })

# Count lines in csv
# path = "/home/arpan/dev/others/csv2sql/apps/csv2sql/priv/test_csvs/user_accounts.csv"
# alias NimbleCSV.RFC4180, as: CSV; path |> File.stream!() |> CSV.parse_stream() |> Enum.count()
