defmodule Csv2sql.Database.ConnectionTestTest do
  @moduledoc """
    Test the connection to the database.
  """
  use Csv2sql.Support.TestHelper, async: false
  @db_wait_time 2000
  alias Csv2sql.Database.ConnectionTest

  describe "check_db_connection/1" do
    db_test "when db url is valid returns connected message" do
      assert :ok == ConnectionTest.check_db_connection(self())
      assert_receive {:connected, pid}, @db_wait_time

      # DB process is stopped after connection check
      refute Process.alive?(pid)

      # Can retry db connect check after successfull connection
      assert :ok == ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, @db_wait_time
    end

    db_test "when repos are already started returns connected message" do
      start_repos()
      assert :ok == ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, @db_wait_time
    end

    db_test "when called multiple times returns :on_going and returns only one response" do
      assert :ok == ConnectionTest.check_db_connection(self())
      assert {:error, :on_going} == ConnectionTest.check_db_connection(self())
      assert {:error, :on_going} == ConnectionTest.check_db_connection(self())
      assert {:error, :on_going} == ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, @db_wait_time
      refute_receive _, @db_wait_time
    end

    db_test "when db url is invalid returns errors message",
            %{db_url: "invalid_user:invalid_pass@badhost/abadpassword"} do
      assert ExUnit.CaptureLog.capture_log(fn ->
               assert :ok == ConnectionTest.check_db_connection(self())
               assert_receive {:error, _}, @db_wait_time
             end) =~
               "badhost"
    end
  end

  describe "check_db_connection/2" do
    db_test "when db url is valid returns connected message" do
      IO.inspect Application.get_env(:csv2sql, :config)
      assert :ok ==
               ConnectionTest.check_db_connection(self(), Application.get_env(:csv2sql, :config))

      assert_receive {:connected, _}, @db_wait_time
    end

    test "when db url is missing returns errors message" do
      args = Application.get_env(:csv2sql, :config) |> Map.put(:db_url, nil)

      assert {:error, "Database configuration not found"} ==
               ConnectionTest.check_db_connection(self(), args)
    end

    db_test "when db url is incorrect can handle further connection check calls" do
      args =
        Application.get_env(:csv2sql, :config)
        |> Map.put(:db_url, "invalid_user:invalid_pass@localhost/abadpassword")

      assert ExUnit.CaptureLog.capture_log(fn ->
               assert :ok == ConnectionTest.check_db_connection(self(), args)
               assert_receive {:error, _}, @db_wait_time
             end) =~
               "Access denied" || "invalid_password"

      # Can handle further calls
      assert :ok ==
               ConnectionTest.check_db_connection(self(), Application.get_env(:csv2sql, :config))

      assert_receive {:connected, _}, @db_wait_time
    end
  end
end
