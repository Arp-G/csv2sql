defmodule Csv2sql.Database.ConnectionTestTest do
  use WithDbSetup

  describe "check_db_connection/1" do
    test "when db url is valid returns connected message" do
      assert :ok == Csv2sql.Database.ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, 500
    end

    @tag db_args: %{db_url: "invalid_user:invalid_pass@badhost/abadpassword"}
    test "when db url is invalid returns errors message" do
      assert :ok == Csv2sql.Database.ConnectionTest.check_db_connection(self())
      assert_receive {:error, _}, 500
    end
  end
end
