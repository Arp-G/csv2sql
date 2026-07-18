# csv2sql

> ⚠️ **v5 rewrite — implementation complete, pre-release.** This branch is
> a ground-up rewrite of csv2sql awaiting review. The released v3 (CLI
> escript + dashboard umbrella) lives on [`develop`](../../tree/develop).

A blazing fast, fully-automated CSV → database importer: point it at a
directory of CSV files and it infers table schemas from the data, creates
the tables, loads the rows in parallel, and validates what arrived.

One app, two faces: a LiveView web UI **and** a headless CLI, shipped as a
single cross-platform [Burrito](https://github.com/burrito-elixir/burrito)
binary (macOS / Linux / Windows).

## Highlights

- **Plain-OTP engine** — per-run supervision trees, concurrent runs,
  inherent backpressure, structural completion, zero global state.
- **Structured errors that never blow up a run** — bad files fail alone,
  poison rows are isolated to `<file>.errors.csv`, transient DB errors
  retry with backoff, and a circuit breaker halts a file that is mostly
  garbage. `--strict` flips to fail-fast.
- **Layered validation** — an in-run row ledger (always), append-aware
  count checks, and per-column fingerprints (min/max/sum/null-count
  computed over the values actually sent, compared against one aggregate
  query per table).
- **Real type inference** — dates/datetimes via custom patterns (a total
  parser, never raises), booleans, integer tiers, dynamic
  VARCHAR/TEXT/LONGTEXT sizing, header repair, per-column user overrides.
- **Encodings & delimiters** — UTF-8/UTF-16 (BOM detected, streamed),
  Latin-1, and comma/semicolon/tab/pipe sniffing.
- **Adapters** — PostgreSQL 12+ and MySQL 5.7+ behind one behaviour with
  overridable defaults; engineered for more (SQLite next).
- **Typed event bus** — every stage emits typed structs over PubSub; the
  UI, CLI reporter, and report writer are all just subscribers.

## Using the web UI

```bash
mix phx.server        # dev — http://localhost:4000
```

Configure source directory + database URL (probe the connection, save
defaults), analyze for a schema preview, override column names/types,
then import. Runs are independent of the browser tab: navigate away,
reconnect, or watch several runs at once. Live error chips + popup, file
table with search/filter/sort, validation results, and downloadable
artifacts (`run_report.json`, `schema.sql`, `<file>.errors.csv`) per run.
The web layer is PWA-capable (manifest + service worker, installable).

## Using the CLI

```bash
csv2sql import --source-dir ./csvs --db-url postgres://user:pass@localhost/mydb
csv2sql analyze --source-dir ./csvs          # dry-run: schema preview only
csv2sql --help
```

- Config precedence: flags > `CSV2SQL_*` env vars > saved defaults > sane
  defaults. `CSV2SQL_DB_PASSWORD` fills a password-less URL so secrets
  stay out of shell history; passwords are never persisted.
- Exit codes: `0` success · `1` completed with errors · `2` run failed ·
  `3` config error.

With no subcommand the binary starts the web UI and opens your browser.

## Building the binary

Cross-platform binaries are built by CI ([release.yml](.github/workflows/release.yml))
via Burrito + Zig for macOS (arm/intel), Linux and Windows x64.

Locally: `MIX_ENV=prod mix assets.deploy && MIX_ENV=prod BURRITO_TARGET=macos_arm mix release csv2sql`
(requires Zig 0.15.2 exactly and xz). Note: Burrito 1.5's pinned Zig
0.15.2 cannot link on macOS 26 (Tahoe) — its SDK ships TBD-v5 stubs that
Zig only parses from 0.16. Build on CI or an older macOS until Burrito
bumps Zig. A plain `mix release` (without the Burrito wrapper) works
everywhere and is what CI smoke-tests against.

## Crash reporting (opt-in)

Set `CSV2SQL_SENTRY_DSN` to enable Sentry for unexpected crashes only —
no DSN, no Sentry. Expected domain errors (a bad CSV is not a bug) are
never reported, and events carry no file contents, paths, or DB URLs.
The HTTP transport is a tiny built-in `:httpc` client — no extra deps.

## Status

| Stage | | |
|---|---|---|
| 1 | Walking skeleton — engine, events, Postgres, ledger, test harness | ✅ |
| 2 | Adapter behaviour + MySQL + byte/param-aware inserts | ✅ |
| 3 | Full type system (dates, booleans, dynamic sizing) | ✅ |
| 4 | Error model, encodings, delimiters | ✅ |
| 5 | Validation ladder + preflight + report | ✅ |
| 6 | CLI + config system | ✅ |
| 7 | LiveView UI + PWA | ✅ |
| 8 | Burrito packaging + Sentry + polish | ✅ |

### Migrating from v3

- MySQL booleans are now `TINYINT(1)` (was `BIT(1)` — bitstrings broke
  aggregate queries and user SQL).
- Postgres date/datetime columns are now real `DATE`/`TIMESTAMP` (v3 fell
  through to VARCHAR).
- Files are **no longer moved** to `imported/`/`validated/` directories;
  run artifacts live in `<source>/csv2sql_runs/<run_id>/`. (A `move_after`
  option is designed but not yet implemented — see below.)
- `schema.sql` is written fresh per run (v3 appended forever).
- Flags renamed: see `csv2sql --help`; the old
  `--db-connection-string` is now a standard `--db-url` URL.

### Deferred (designed-for, not in v1)

`move_after` post-success file moving · server-side directory browser
component · deep checksum validation layer · watch-folder mode · SQLite
adapter · PG `COPY` / MySQL `LOAD DATA` fast paths · import history +
retry-failed · named config profiles · gzip/xlsx input · sampling-based
analyze for huge files.

## Development

Requires Erlang/Elixir per [`.tool-versions`](.tool-versions) and a local
PostgreSQL (and optionally MySQL) for the integration tests.

```bash
mix setup                    # deps + assets
MIX_ENV=test mix test        # full suite (or --exclude postgres --exclude mysql)
mix credo --strict           # lint
mix dialyzer                 # types
```

Adapter tests read `CSV2SQL_TEST_POSTGRES_URL` / `CSV2SQL_TEST_MYSQL_URL`
(defaults target localhost). CI runs the suite against PG 16 + MySQL 8.4
and a compatibility job on PG 12 + MySQL 5.7.

Architecture notes: [ARCHITECTURE.md](ARCHITECTURE.md).

## License

[MIT](https://github.com/Arp-G/csv2sql/blob/develop/LICENSE.md)
