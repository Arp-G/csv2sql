defmodule Csv2sql.Database.ConnectionTestTest do
  @moduledoc """
    Test the connection to the database.
  """
  use WithDbSetup
  @db_wait_time 2000
  alias Csv2sql.Database.ConnectionTest

  describe "check_db_connection/1" do
    test "when db url is valid returns connected message" do
      assert :ok == ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, @db_wait_time
    end

    test "when called multiple times returns :on_going and returns only one response" do
      assert :ok == ConnectionTest.check_db_connection(self())
      assert {:error, :on_going} == ConnectionTest.check_db_connection(self())
      assert {:error, :on_going} == ConnectionTest.check_db_connection(self())
      assert {:error, :on_going} == ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, @db_wait_time
      refute_receive _, @db_wait_time
    end

    @tag db_args: %{db_url: "invalid_user:invalid_pass@badhost/abadpassword"}
    test "when db url is invalid returns errors message" do
      assert ExUnit.CaptureLog.capture_log(fn ->
               assert :ok == ConnectionTest.check_db_connection(self())
               assert_receive {:error, _}, @db_wait_time
             end) =~
               "(DBConnection.ConnectionError) (badhost:3306) non-existing domain - :nxdomain"
    end
  end
end
