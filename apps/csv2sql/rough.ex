# repo = Csv2sql.Database.get_repo(:postgres)
# {:ok, conn} = repo.start_link( url: "ecto://postgres:postgres@localhost/crm_notification_dev")
# Csv2sql.Config.Loader.load(%{ db_type: "mysql", db_url: System.get_env("DB_URL"), log: System.get_env("LOG_LEVEL"), source_directory: System.get_env("SOURCE_DIRECTORY") })
