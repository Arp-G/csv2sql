measure2 = fn fn1, fn2 ->
  Benchee.run(
  %{
    "func_1" => fn1,
    "func_2" => fn2
  },
  warmup: 1,
  time: 5,
  memory_time: 2,
  reduction_time: 2
)
end

measure1 = fn func ->
  Benchee.run(
  %{
    "func" => func
  }
)
end

# iex(3)> x="/home/arpan/dev/csv2sql/apps/csv2sql/priv/src/test.csv"
# "/home/arpan/dev/csv2sql/apps/csv2sql/priv/src/test.csv"
# iex(4)> measure2.(fn -> Csv2sql.SchemaMaker.get_types  end, fn -> Csv2sql.TypeDeducer.get_types(x) end)

# measure2.(fn -> Csv2sql.SchemaMaker.get_types  end, fn -> Csv2sql.TypeDeducer.get_types end)