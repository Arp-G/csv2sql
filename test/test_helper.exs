# Isolate persisted defaults: every Store.load/save in the suite hits a
# throwaway file, never the developer's real user-config.
System.put_env(
  "CSV2SQL_CONFIG_PATH",
  Path.join(System.tmp_dir!(), "csv2sql_test_config_#{System.unique_integer([:positive])}.json")
)

# max_cases bounds how many DB-heavy tests run at once: every engine test
# owns a pool plus short-lived probe/verification connections, and an
# unbounded suite exhausts a default Postgres (max_connections = 100),
# turning into connection-retry noise and flaky slowdowns.
ExUnit.start(max_cases: 8)
