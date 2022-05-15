defmodule Csv2sql.DatabaseTest do
  @moduledoc false

  use Csv2sql.Support.TestHelper
  alias Csv2sql.Database

  setup_all do
    start_repos()
  end

  describe "run_query/1" do
    db_test "attemps to runs given query string" do
      assert match?(%{rows: [[1]]}, Database.run_query!("SELECT 1"))
    end
  end

  describe "run_query/2" do
    db_test "attemps to runs given query string" do
      1
    end
  end
end
