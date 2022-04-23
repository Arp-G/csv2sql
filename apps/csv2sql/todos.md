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