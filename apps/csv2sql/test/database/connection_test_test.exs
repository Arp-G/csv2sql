defmodule Csv2sql.Database.ConnectionTestTest do
  use WithDbSetup

  describe "check_db_connection/1" do
    setup do
      [abc: "abc"]
    end

    test "when db url is invalid" do
      # args = Application.get_env(:csv2sql, :config)

      assert :ok == Csv2sql.Database.ConnectionTest.check_db_connection(self())
      assert_receive {:connected, _}, 500
    end
  end
end


# defmacro __using__(options) do
#   quote do
#     use ExUnit.Case

#     @moduletag unquote(options)

#     test "sums a list of integers", %{calculator: calculator} do
#       assert calculator.sum_list([1, 2, 3, 4]) == 10
#     end
#   end
# end
