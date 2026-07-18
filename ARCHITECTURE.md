# csv2sql v5 — Architecture

Csv2sql bulk-loads CSV files into a database with automatic schema
inference. This document describes the v5 engine; it is kept current as
stages of the [rewrite roadmap](#roadmap) land.

## Design principles

1. **No global mutable state.** A run's configuration is one validated,
   immutable `%Csv2sql.Config{}` passed down the pipeline. Nothing reads
   application env at runtime; nothing is globally named.
2. **Structural completion.** A run is done when its pipeline fold
   returns — there are no completion counters, drain protocols, or
   busy-wait loops (the failure modes that killed the v3 and v4.0
   architectures).
3. **One event bus.** Every stage broadcasts typed event structs on a
   per-run `Phoenix.PubSub` topic. The LiveView UI, the CLI reporter, the
   report writer, and the test harness are all plain subscribers — there
   is no other progress/error channel.
4. **Errors are data.** Cell-level checks are total functions; malformed
   input becomes structured `%Csv2sql.Error{}` values with a class
   (`:preflight | :run | :file | :row | :transient`) that defines the
   blast radius. A bad file fails alone; the run continues.
5. **Adapters own dialects.** The engine speaks abstract column types
   (`{:varchar, n} | :text | :longtext | :integer | :bigint | :float |
   :boolean | :date | :datetime`); `Csv2sql.Adapter` callbacks (with
   overridable defaults) render SQL. No `ecto_sql`/repos — drivers
   (Postgrex/MyXQL) are used directly; core `ecto` provides embedded
   schemas + changesets for boundary data and config validation only.
   **Compatibility floors: MySQL 5.7 and PostgreSQL 12** — adapter SQL
   stays conservative (no CTEs, no MySQL-8-only collations, portable
   aggregates), and CI exercises both the newest and the oldest
   supported servers.

## Process architecture

```
Csv2sql.Application (one_for_one)
├── Phoenix.PubSub          (Csv2sql.PubSub — the event bus)
├── Registry                (Csv2sql.RunRegistry — per-run process names)
├── DynamicSupervisor       (Csv2sql.RunsSupervisor — one child per run)
├── Task.Supervisor         (Csv2sql.ProbeSupervisor — UI connection probes)
└── Csv2sqlWeb.Endpoint     (GUI mode)

Per run (temporary, max_restarts: 0 — nothing inside a run restarts):
Run.Supervisor
├── Run.Server              state + events + cancel; monitors the pipeline
└── core (Supervisor)
    ├── DB pool             Postgrex, owned by the run, dies with it
    ├── Task.Supervisor     file workers
    └── Run.Pipeline        (Task) the orchestration fold
```

- **Isolation:** every process registers in `Csv2sql.RunRegistry` keyed by
  `run_id` (`Csv2sql.Run.server_name/1` etc.), so concurrent runs coexist
  and a crashed run cannot poison the next.
- **Failure handling:** worker crashes become file-level errors
  (`async_stream_nolink`); a pipeline crash is converted to `RunFailed` by
  `Run.Server` (which monitors it); a server crash tears down the run
  tree (`max_restarts: 0`).
- **Cancellation:** `Run.Server.cancel/1` stops the core supervisor
  (pipeline + workers die, pool closes), emits `RunCancelled`, and the
  tree is torn down after a grace period.

## The pipeline

```
Run.Pipeline.run/2
  discover files (stable lexicographic order)
  Task.Supervisor.async_stream_nolink(files, &FilePipeline.run/2,
                                      max_concurrency: file_workers)
  Server.complete(results)          ← returning IS completion

FilePipeline.run/2 (per file)
  pass 1  analyze: stream → chunks → Task.async_stream(infer) → merge
          (associative: AND type flags, max lengths, min/max int bounds —
           constant memory regardless of file size)
          → header repair (trim, blank→column_N, dedupe) → resolve types
  DDL     drop (table_mode :drop) + CREATE TABLE IF NOT EXISTS
  pass 2  load: stream → chunks → Task.async_stream(encode + insert,
          max_concurrency: insert_workers)
          Backpressure is inherent: busy insert workers pause reading.
  ledger  rows_read == rows_inserted + rows_rejected, per chunk, using
          driver-reported insert counts (never assumed)
```

`mode: :analyze` stops after pass 1 — the dry-run behind schema preview.
Analyze runs start **no database children at all** (no pool, no
ensure_database): dry runs work fully offline.

Insert chunks respect three limits at once (`Csv2sql.Load.Chunker`,
issue #21): the configured row bound, the adapter's positional-parameter
cap (`max_params / column_count`), and a byte budget = configured bytes
capped by the server's probed packet size (`@@max_allowed_packet` on
MySQL). Before the pool starts, `ensure_database/1` runs isolated in
`ProbeSupervisor` (a crashing probe pool must never kill its caller):
MySQL auto-creates the database; Postgres verifies it and reports
`{:database_not_found, name}` via a maintenance-database check.

## Events

All in `Csv2sql.Events`, all structs with `run_id` + `at`:

`RunStarted` · `FileDiscovered` · `AnalyzeStarted` · `AnalyzeCompleted` ·
`SchemaCreated` · `LoadProgress` · `FileCompleted{ledger, timings}` ·
`FileFailed{error}` · terminal: `RunCompleted{summary}` · `RunFailed` ·
`RunCancelled`.

Subscribe with `Events.subscribe(run_id)`; `Csv2sql.start_run(config,
subscribe: true)` subscribes the caller *before* the run starts so no
event can be missed.

## Validation ladder

1. **Ledger** (always on, free): in-run double-entry accounting, checked
   per chunk. Implemented.
2. **Counts** (planned): post-load `COUNT(*)` vs ledger, append-aware.
3. **Fingerprints** (planned, default-on toggle): per-column O(1)
   aggregates over post-transform values vs one aggregate query per table.
4. **Deep checksum** (planned, opt-in).

## Testing

- DB-backed modules use ExUnit **parameterized tests** (since 1.18) —
  the whole module runs once per adapter, concurrently:

  ```elixir
  use Csv2sql.EngineCase, async: true,
    parameterize: Csv2sql.EngineCase.db_parameters()
  ```

  Parameters (`db_adapter`, `db_url`) merge straight into the test
  context. Selection is decided once at load: `CSV2SQL_TEST_ADAPTERS`
  env (pinned in CI) or local reachability, Postgres as baseline.
- `Csv2sql.EngineCase`: per-test tmp dirs, `csv!/3` fixture builder,
  `unique_name/1` (collision-free tables → DB tests run `async: true`),
  `run_import/3` (subscribed run + collected events + auto table
  cleanup), `assert_event/2`, `db_query!/3` — all context-aware.
- Doctests document and pin the pure functions (TypeCheck, Inference,
  Resolve, Encoder, Ledger, Db URL parsing).
- Integration tests drive full runs and verify against
  `information_schema` and real row data.
- DB-backed tests are tagged `:db` and excludable: `mix test --exclude db`.
- **Local gotcha:** this machine exports `MIX_ENV=dev`, so run tests as
  `MIX_ENV=test mix test`.

## Type system

Inference flags per column: empty / boolean / integer / float / date /
datetime, with max char length, max byte length, and integer bounds.
Resolution priority: empty → varchar(limit) · **boolean** (`true/false/
1/0`; 0/1-only columns are boolean by design, v3 parity) · integer
(int32 → int64 BIGINT tier; beyond → string) · float · date · datetime ·
strings sized dynamically — `varchar(actual)` up to `varchar_limit`,
`text` beyond, `longtext` past 64 KiB of bytes.

Dates/datetimes parse via `Csv2sql.TimeParse` — a small pattern compiler
for the `{YYYY}-{0M}-{0D}` token syntax (Timex-compatible, but **total**:
malformed content returns `:error`, never raises — issue #24). Patterns
come from config (`date_patterns` / `datetime_patterns`, validated at
config build), are compiled once per run, and drive both inference and
encoding. All-zero dates (`0000-00-00`) keep a column date-typed and
load as `NULL`. `ordered: true` prepends a `csv_ordering_id` BIGINT
column preserving CSV row order.

Every run writes `schema.sql` into its artifacts directory
(`<source>/csv2sql_runs/<run_id>/`) — analyze mode included, so a dry
run yields a reviewable schema.

## Error model

`%Csv2sql.Error{}` classes define blast radius: `:row` (rejected into
`<file>.errors.csv` with row number + reason + original cells — fix and
re-import), `:file` (siblings continue), `:run` (graceful halt,
unfinished files `:skipped`), plus `:preflight`/`:transient`. Adapters
classify driver errors (`classify_error/1` → `:row_data | :transient |
:connection | :fatal`).

Chunk failures are handled **in place, never queued**: `:row_data` →
immediate row-by-row isolation (a failed multi-VALUES statement inserted
nothing, so re-sending cannot duplicate); `:transient`/`:connection` →
same statement retried after doubling backoff (`error_policy.max_retries`
× `backoff_ms`, `ChunkRetried` events); exhausted `:connection` →
run-fatal (`database_unreachable`); `:fatal` → file failure. The
per-file circuit breaker (`row_error_threshold_pct`, default 5%, armed
after `row_error_min_sample` rows) fails a systematically-broken file
early instead of grinding through millions of rejects. `strict: true`
escalates any file failure into a run halt. Note: cast-time rejects
cannot occur naturally (inference sees every value and widens the type);
they become reachable with user type-overrides.

## Encodings & delimiters

`Reader.detect/2` runs once per file: BOM sniffing picks UTF-8/UTF-16
LE/BE (config can force `:utf8`/`:utf16`/`:latin1`), delimiter `:auto`
samples the first lines (quote-aware consistency vote across comma/
semicolon/tab/pipe — compile-time NimbleCSV parsers per delimiter).
UTF-16 is transcoded streamingly with carry across chunk boundaries;
invalid sequences raise `Reader.EncodingError` → a parse-stage file
error (refusing beats corrupting). Detected encoding/delimiter are
recorded on the file (surfaced in UI/report).

## UI notes (for stage 7 — agreed with Arpan 2026-07)

- **Live activity, out of the way:** a status strip of live counter chips
  (retries · isolated chunks · rejected rows · failed files) that pulse on
  change; clicking opens a slide-over Activity panel — a live, filterable
  event feed (LiveView streams, ring buffer of ~200 entries) with each
  entry expandable to the full `%Error{}` + errors.csv link. Per-file rows
  get small inline badges (retrying dot, rejected count). Toasts only for
  escalations (file failed / run aborted), never row-level noise. Powered
  entirely by the event bus — `ChunkRetried` / `RowsRejected` are emitted
  by the engine (stage 4) precisely so the UI can subscribe later.
- **File table at scale:** LiveView `streams` + windowed rendering with
  pagination (bounded DOM); server-side debounced search by file name;
  status filter chips (pending/analyzing/loading/done/failed/rejected>0);
  sorts by status, size, progress %, rows, rejected count, duration,
  throughput. All filtering/sorting is server-side over `Run.Server`
  state — the browser only ever holds the visible window.

## Roadmap

Stages (from the approved v5 plan): **1. walking skeleton ✅** ·
**2. adapters + MySQL + insert engine ✅** · **3. full type system ✅** ·
**4. error model, encodings, delimiters ✅** ·
5. validation ladder + preflight + run_report.json · 6. CLI + config
sources/persistence · 7. LiveView UI + PWA · 8. Burrito packaging +
Sentry + docs.
