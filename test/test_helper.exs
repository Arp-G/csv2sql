# max_cases bounds how many DB-heavy tests run at once: every engine test
# owns a pool plus short-lived probe/verification connections, and an
# unbounded suite exhausts a default Postgres (max_connections = 100),
# turning into connection-retry noise and flaky slowdowns.
ExUnit.start(max_cases: 8)
