defmodule Csv2sql.SourceTest do
  # Stage-4 acceptance: encodings (BOM/UTF-16/Latin-1) and delimiters
  # (explicit + sniffed) load correctly end-to-end.
  use Csv2sql.EngineCase, async: true, parameterize: Csv2sql.EngineCase.db_parameters()

  @moduletag :db

  describe "encodings" do
    test "UTF-8 BOM never leaks into the first header (issue #19)", %{tmp_dir: dir} = ctx do
      table = unique_name("bom8")
      content = <<0xEF, 0xBB, 0xBF>> <> "id,note\n7,hi\n"
      File.write!(Path.join(dir, table <> ".csv"), content)

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed
      [file] = Run.files_in_order(run)
      assert file.encoding == :utf8
      assert [%{name: "id"}, %{name: "note"}] = file.columns
      assert select!(ctx, table, ~w(note), "id") == [["hi"]]
    end

    test "UTF-16 LE and BE are detected by BOM and transcoded (issue #35)",
         %{tmp_dir: dir} = ctx do
      le_table = unique_name("utf16le")
      be_table = unique_name("utf16be")
      text = "id,náme\n1,Zoé\n2,日本語\n"

      le = <<0xFF, 0xFE>> <> :unicode.characters_to_binary(text, :utf8, {:utf16, :little})
      be = <<0xFE, 0xFF>> <> :unicode.characters_to_binary(text, :utf8, {:utf16, :big})
      File.write!(Path.join(dir, le_table <> ".csv"), le)
      File.write!(Path.join(dir, be_table <> ".csv"), be)

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed
      files = Run.files_in_order(run)

      le_file = Enum.find(files, &(&1.table_name == le_table))
      be_file = Enum.find(files, &(&1.table_name == be_table))
      assert le_file.encoding == :utf16le
      assert be_file.encoding == :utf16be
      assert [%{name: "id"}, %{name: "náme"}] = le_file.columns

      assert select!(ctx, le_table, ~w(náme), "id") == [["Zoé"], ["日本語"]]
      assert select!(ctx, be_table, ~w(náme), "id") == [["Zoé"], ["日本語"]]
    end

    test "Latin-1 loads when configured", %{tmp_dir: dir} = ctx do
      table = unique_name("latin1")
      File.write!(Path.join(dir, table <> ".csv"), <<"id,note\n1,caf", 0xE9, "\n">>)

      %{run: run} = run_import(dir, ctx, %{encoding: :latin1})

      assert run.status == :completed
      [file] = Run.files_in_order(run)
      assert file.encoding == :latin1
      assert select!(ctx, table, ~w(note), "id") == [["café"]]
    end

    test "a truncated UTF-16 file fails with a parse-stage error, run continues",
         %{tmp_dir: dir} = ctx do
      good = unique_name("good_enc")
      bad = unique_name("bad_enc")

      text = "id\n1\n"
      valid = <<0xFF, 0xFE>> <> :unicode.characters_to_binary(text, :utf8, {:utf16, :little})
      # Chop one byte: a UTF-16 file with an odd byte count is corrupt.
      truncated = binary_slice(valid, 0..(byte_size(valid) - 2)//1)

      File.write!(Path.join(dir, bad <> ".csv"), truncated)
      csv!(dir, good <> ".csv", [~w(id), ["7"]])

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed_with_errors
      files = Run.files_in_order(run)
      bad_file = Enum.find(files, &(&1.table_name == bad))
      good_file = Enum.find(files, &(&1.table_name == good))

      assert bad_file.status == :failed
      assert [%{stage: :parse, reason: "encoding_error"}] = bad_file.errors
      assert good_file.status == :done
    end
  end

  describe "delimiters" do
    test "explicit delimiter config wins", %{tmp_dir: dir} = ctx do
      table = unique_name("semi")
      File.write!(Path.join(dir, table <> ".csv"), "id;note\n1;a,b\n")

      %{run: run} = run_import(dir, ctx, %{delimiter: :semicolon})

      assert run.status == :completed
      [file] = Run.files_in_order(run)
      assert file.delimiter == :semicolon
      assert [%{name: "id"}, %{name: "note"}] = file.columns
      assert select!(ctx, table, ~w(note), "id") == [["a,b"]]
    end

    test "tab and pipe are sniffed automatically", %{tmp_dir: dir} = ctx do
      tab_table = unique_name("tabs")
      pipe_table = unique_name("pipes")
      File.write!(Path.join(dir, tab_table <> ".csv"), "id\tnote\n1\thello\n2\tworld\n")
      File.write!(Path.join(dir, pipe_table <> ".csv"), "id|note\n1|foo\n2|bar\n")

      %{run: run} = run_import(dir, ctx)

      assert run.status == :completed
      files = Run.files_in_order(run)

      tab_file = Enum.find(files, &(&1.table_name == tab_table))
      pipe_file = Enum.find(files, &(&1.table_name == pipe_table))
      assert tab_file.delimiter == :tab
      assert pipe_file.delimiter == :pipe

      assert select!(ctx, tab_table, ~w(note), "id") == [["hello"], ["world"]]
      assert select!(ctx, pipe_table, ~w(note), "id") == [["foo"], ["bar"]]
    end
  end
end
