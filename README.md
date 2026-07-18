# csv2sql

> ⚠️ **v5 rewrite in progress.** This branch is a ground-up rewrite of
> csv2sql. The released v3 (CLI escript + dashboard umbrella) lives on
> [`develop`](../../tree/develop).

A blazing fast, fully-automated CSV → database importer: point it at a
directory of CSV files and it infers table schemas from the data, creates
the tables, loads the rows in parallel, and validates what arrived.

## v5 goals

- One app, two faces: a LiveView web UI **and** a headless CLI, shipped as
  a single cross-platform [Burrito](https://github.com/burrito-elixir/burrito)
  binary (macOS / Linux / Windows).
- Robust plain-OTP engine: per-run supervision, concurrent runs, inherent
  backpressure, structural completion — no global state.
- Structured errors that never blow up a run: bad files fail alone, bad
  rows are isolated to `<file>.errors.csv`, everything lands in a report.
- Layered validation: in-run row ledger, count checks, and per-column
  fingerprint comparison.
- Extensible DB adapters: PostgreSQL and MySQL first, engineered for more.

## Status

| Stage | | |
|---|---|---|
| 1 | Walking skeleton — engine, events, Postgres, ledger, test harness | ✅ |
| 2 | Adapter behaviour + MySQL + byte/param-aware inserts | ✅ |
| 3 | Full type system (dates, booleans, dynamic sizing) | ✅ |
| 4 | Error model, encodings, delimiters | ✅ |
| 5 | Validation ladder + preflight + report | ✅ |
| 6 | CLI + config system | ⏸ deferred |
| 7 | LiveView UI + PWA | 🔶 core done |
| 8 | Burrito packaging + polish | ⬜ |

Stage 7 core: import workspace (config form, connection test, dry-run/
import), detached live run monitor (streams file table with search/
filter/sort, activity feed, cancel, validation + report). Remaining:
schema editor with type overrides, file selection & naming, sample-rows
preview, directory browser, settings drawer, config persistence, PWA
manifest/SW. Run the UI with `mix phx.server` → http://localhost:4000.

## Development

Requires Erlang/Elixir per [`.tool-versions`](.tool-versions) and a local
PostgreSQL for the integration tests.

```bash
mix setup                    # deps + assets
MIX_ENV=test mix test        # full suite (or --exclude postgres)
mix credo --strict           # lint
mix dialyzer                 # types
```

Architecture notes: [ARCHITECTURE.md](ARCHITECTURE.md).

## License

[MIT](https://github.com/Arp-G/csv2sql/blob/develop/LICENSE.md)
