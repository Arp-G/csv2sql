defmodule Csv2sql.EngineCaseTest do
  # Verifies the harness's parameterization contract: if CaseTemplate ever
  # stops forwarding :parameterize (or db_parameters/0 regresses), the
  # bare context access below fails loudly — the engine tests themselves
  # would silently fall back to defaults.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  test "db parameters are merged into the test context", ctx do
    assert Map.fetch!(ctx, :db_adapter) in [:postgres, :mysql]
    assert Map.fetch!(ctx, :db_url) == Csv2sql.EngineCase.test_db_url(ctx.db_adapter)
    assert db_params(ctx) == %{adapter: ctx.db_adapter, url: ctx.db_url}
  end

  test "db_parameters/0 is memoized" do
    assert Csv2sql.EngineCase.db_parameters() == Csv2sql.EngineCase.db_parameters()
    assert [%{db_adapter: _, db_url: _} | _] = Csv2sql.EngineCase.db_parameters()
  end
end
