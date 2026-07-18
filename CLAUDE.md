# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Branch context (important)

- **`v5` (this branch)** is a ground-up rewrite: a single Phoenix 1.8 app
  (no umbrella) built per the approved v5 plan. It shares **no code** with
  the other branches.
- `master`/`develop` hold the old working v3 umbrella app;
  `version-4.0` is an abandoned GenStage/Flow rewrite. Both are
  reference-only — do not port their global-state patterns here.
- Untracked v4-era files (old CLAUDE.md, `.env.*.test`, `test/support/`)
  were preserved in a git stash before this branch was created:
  `git stash list` → "v4-workflow untracked files…".

## Commands

```bash
MIX_ENV=test mix test         # REQUIRED: this machine exports MIX_ENV=dev
                              # (plain `mix test` compiles into _build/dev
                              # and fails to find test/support modules)
MIX_ENV=test mix test --exclude db         # skip DB-backed tests entirely

mix format                    # formatter
mix credo --strict            # lint (must stay clean)
mix dialyzer                  # types (must stay clean; PLT in priv/plts)
mix compile --warnings-as-errors
mix phx.server                # web UI (stage 7 — stock scaffold for now)
```

DB-backed tests default to `postgres://postgres:postgres@localhost:5432/postgres`;
override with `CSV2SQL_TEST_POSTGRES_URL`. Tables are per-test unique and
dropped automatically — safe to run against a local server.

## Architecture

Read `ARCHITECTURE.md` first. The short version:

- `lib/csv2sql/` is the engine (zero web deps); `lib/csv2sql_web/` is the
  LiveView UI. Public API: `Csv2sql.start_run/2`, `await/2`,
  `cancel_run/1`, `run_state/1`.
- Per-run supervision trees under `Csv2sql.RunsSupervisor`, names scoped
  in `Csv2sql.RunRegistry` — **never add a globally named process** to
  the run path, and never read `Application.get_env` in engine code;
  everything flows from `%Csv2sql.Config{}`.
- Progress/errors travel ONLY as typed `Csv2sql.Events` structs on
  PubSub. New stages emit events; UIs/tests subscribe.
- All boundary data is Ecto **embedded schemas** (core `ecto` only — no
  ecto_sql, no repos). DB access goes through `Csv2sql.Adapter`
  callbacks; drivers are Postgrex/MyXQL directly.
- Cell-level functions are **total** — return tagged tuples, never raise
  on malformed data (upstream issue #24 class).

## Conventions

- `@moduledoc` on every module, `@spec` on public functions, doctests on
  pure functions. `mix credo --strict` and `mix dialyzer` must stay clean.
- `alias Csv2sql.File, as: CsvFile` (it clashes with Elixir's `File`).
- Tests: DB-backed modules use ExUnit **parameterized tests** (no
  per-DB macros):
  `use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()`
  + `@moduletag :db`. Parameters (`db_adapter`, `db_url`) merge into the
  test context; helpers (`run_import/3`, `build_config/3`, `db_query!/3`)
  take the context. Adapter selection: `CSV2SQL_TEST_ADAPTERS` env
  (pinned in CI), defaulting to what's reachable locally.
  `unique_name/1` for anything hitting the DB so `async: true` stays safe.
- **DB compatibility floors: MySQL 5.7, PostgreSQL 12.** Adapter SQL
  stays conservative (no CTEs, no MySQL-8-only collations — utf8mb4_general_ci,
  `SUM(CASE WHEN …)` over vendor niceties). CI runs the suite against
  newest AND oldest supported servers.
- Commits are granular; PRs target `develop` per repo convention (the v5
  branch will merge when the rewrite reaches parity).

## Roadmap position

Stage 1 (walking skeleton) is complete: Postgres-only happy path,
minimal types (int/bigint/float/varchar/text), ledger validation, full
event bus, 44 tests. Next stages: 2 adapters+MySQL, 3 full type system,
4 error model/encodings, 5 validation+report, 6 CLI+config, 7 UI+PWA,
8 Burrito+Sentry. Details in ARCHITECTURE.md and the plan file.
