defmodule Csv2sql.ConfigTest do
  use ExUnit.Case, async: true

  alias Csv2sql.Config

  @moduletag :tmp_dir

  defp valid_params(dir) do
    %{source_dir: dir, db: %{adapter: :postgres, url: "postgres://localhost/testdb"}}
  end

  test "valid params produce a config with defaults applied", %{tmp_dir: dir} do
    assert {:ok, config} = Config.new(valid_params(dir))

    assert config.mode == :import
    assert config.table_mode == :drop
    assert config.file_workers == System.schedulers_online()
    assert config.insert_workers == 4
    assert config.analyze_chunk_rows == 1000
    assert config.insert_chunk_rows == 2000
    assert config.varchar_limit == 200
    assert config.db.adapter == :postgres
  end

  test "source_dir must exist" do
    params = %{
      source_dir: "/definitely/not/a/real/dir",
      db: %{adapter: :postgres, url: "postgres://localhost/testdb"}
    }

    assert {:error, changeset} = Config.new(params)
    assert %{source_dir: ["is not an existing directory"]} = errors_on(changeset)
  end

  test "db url is required", %{tmp_dir: dir} do
    assert {:error, changeset} = Config.new(%{source_dir: dir, db: %{adapter: :postgres}})
    assert %{db: %{url: ["can't be blank"]}} = errors_on(changeset)
  end

  test "db url scheme and database are validated", %{tmp_dir: dir} do
    assert {:error, changeset} =
             Config.new(%{source_dir: dir, db: %{url: "foo://localhost/x"}})

    assert %{db: %{url: ["must start with postgres:// or mysql://"]}} = errors_on(changeset)

    assert {:error, changeset} =
             Config.new(%{source_dir: dir, db: %{url: "postgres://localhost"}})

    assert %{db: %{url: ["must include a database name"]}} = errors_on(changeset)
  end

  test "the adapter is derived from the URL scheme", %{tmp_dir: dir} do
    assert {:ok, config} = Config.new(%{source_dir: dir, db: %{url: "mysql://localhost/x"}})
    assert config.db.adapter == :mysql

    assert {:ok, config} = Config.new(%{source_dir: dir, db: %{url: "postgres://localhost/x"}})
    assert config.db.adapter == :postgres
  end

  test "an explicit adapter must match the URL scheme", %{tmp_dir: dir} do
    assert {:error, changeset} =
             Config.new(%{source_dir: dir, db: %{adapter: :postgres, url: "mysql://localhost/x"}})

    assert %{db: %{url: ["scheme does not match adapter postgres"]}} = errors_on(changeset)
  end

  test "insert_chunk_bytes bounds are enforced", %{tmp_dir: dir} do
    params = Map.put(valid_params(dir), :insert_chunk_bytes, 1000)
    assert {:error, _changeset} = Config.new(params)

    assert {:ok, config} = Config.new(valid_params(dir))
    assert config.insert_chunk_bytes == 4_194_304
  end

  test "numeric bounds are enforced", %{tmp_dir: dir} do
    params = Map.put(valid_params(dir), :file_workers, 0)
    assert {:error, changeset} = Config.new(params)
    assert %{file_workers: [_message]} = errors_on(changeset)

    params = Map.put(valid_params(dir), :varchar_limit, 100_000)
    assert {:error, _changeset} = Config.new(params)
  end

  test "the db url never leaks through inspect", %{tmp_dir: dir} do
    {:ok, config} = Config.new(valid_params(dir))
    refute inspect(config.db) =~ "postgres://"
  end

  defp errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
