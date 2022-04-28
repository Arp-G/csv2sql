defmodule Csv2sql.Database.ConnectionTestTest do
  @moduledoc """
    Test the connection to the database.
  """
  use WithDbSetup

  describe "check_db_connection/1" do
    test "when db url is valid returns connected message" do
      assert :ok == Csv2sql.Database.ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, 1000
      :timer.sleep(1000)
    end

    @tag db_args: %{db_url: "invalid_user:invalid_pass@badhost/abadpassword"}
    test "when db url is invalid returns errors message" do
      assert ExUnit.CaptureLog.capture_log(fn ->
        assert :ok == Csv2sql.Database.ConnectionTest.check_db_connection(self())
        assert_receive {:error, _}, 1000
      end) =~ "(DBConnection.ConnectionError) (badhost:3306) non-existing domain - :nxdomain"
    end
  end
end
