gracefully termination of producers
benchmarking against previous solution and "load in file" (previous point is pre-requisite) - test with and without preload in producer
db connect required?
observer module
validator
error tracker module and gracefull termination in case of various type of errors
fix csv - dup col names, invalid col names, encoding issue, etc
tests, docs, comments, dialyzer

Benchmarking results:
Single file: faster 1.5x
Bulk test: 5~7 sec faster
preloading in producer had no affect; removed it

"2022-05-29 15:51:14.546662Z analyzing files"
"2022-05-29 16:04:23.202254Z FINISH producer for \"/home/arpan/dev/csv2sql/apps/csv2sql/priv/src/test3.csv\""

# Todo List

* Move the config parsing into a separate testable module, setup proper default values

* INFER SCHEMA Stage:
  - After kick off use Flow to read ahead chunks of data and feed it into a flow stage to parse csv string.
  - Send csv string to a flow stage to map the type for every row
  - Finally send a flow stream to reduce to get the final type

* INSERT INTO DB GenStage pipeline:
  - Prepare a genStage pipeline on application start.
  - Pipeline has 1 producer for every csv file.
  - Producers are sitting idly
  - After inferring schema kick-off the respective producer by sending it the schema.
  - Before kickoff table is created.
  - Producer reads data from file stream in chunks and send it to the next consumer-producer stage
  - A DynamicConsumerSupervisor in-between produces multiple consumer-producers subscribed to every producer.
  - Each consumer-producer receives a chunk and encodes it in the format suitable for db insertion and sends it to the next consumer stage.
  - A DynamicConsumerSupervisor produces min(cpu-cores * 2, db pool) number of consumers, which insert a chunk into the correct table

* Validation
  - A separate GenStage/Flow pipeline to validate the data.


Tag test with DB and test these tests for both postgres and mysql.


Done:

* Config Management
Better config parsing, use separate config structs, better code organization in modules, typespecs, 90%+ test coverage

* TODO configs:
  * Auto drop table if exists

* Csv Type inference
  Better type inference and cpu utilization(10% increased cpu usage), using Flow
  For 818 MB csv with 34959673 rows with older apporoach it took 126 seconds vs 120 seconds with new approach.
  Introduced flow and parallalized reduction of types maps for different chunks
  better code organization, typespecs and 90%+ test coverage.

  The little improvement in peroformance becomes significant for larger csv files

  Details:
    Name             ips        average  deviation         median         99th %
    func_2       0.00831       2.01 min     ±0.00%       2.01 min       2.01 min
    func_1       0.00788       2.12 min     ±0.00%       2.12 min       2.12 min

    Comparison:
    func_2       0.00831
    func_1       0.00788 - 1.06x slower +0.110 min

    Memory usage statistics:

    Name      Memory usage
    func_2      0.00001 GB
    func_1        38.00 GB - 3284106.23x memory usage +38.00 GB

Windows terminal with nmake:

from run: cmd /K "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" amd64
