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

- `Csv2sql.EngineCase`: per-test tmp dirs, `csv!/3` fixture builder,
  `unique_name/1` (collision-free tables → DB tests run `async: true`),
  `run_import/2` (subscribed run + collected events + auto table
  cleanup), `assert_event/2`, `db_query!/2`.
- Doctests document and pin the pure functions (TypeCheck, Inference,
  Resolve, Encoder, Ledger, Db URL parsing).
- Integration tests drive full runs and verify against
  `information_schema` and real row data.
- DB-backed tests are tagged (`:postgres`) and excludable:
  `mix test --exclude postgres`.
- **Local gotcha:** this machine exports `MIX_ENV=dev`, so run tests as
  `MIX_ENV=test mix test`.

## Roadmap

Stages (from the approved v5 plan): **1. walking skeleton ✅** ·
2. adapter behaviour + MySQL + byte/param-aware insert engine ·
3. full type system (dates via TimeParse compiler, booleans, sizing) ·
4. error model (row isolation → errors.csv), encodings, delimiters ·
5. validation ladder + preflight + run_report.json · 6. CLI + config
sources/persistence · 7. LiveView UI + PWA · 8. Burrito packaging +
Sentry + docs.
