# Csv2sql


<img src="https://github.com/Arpan-Kreeti/csv2sql/blob/master/repo_image.png"
     alt="csv2sql image"
     style="float: left; margin-right: 10px;" />

  

## What is Csv2sql ?

  

Csv2sql is a blazing fast fully automated tool to load huge csv files into a mysql database.

  

Csv2 sql can automatically...

  

* Reads csv files and infers the database table structure

  

* Creates the database and the required tables

  

* Inserts all the csvs into the database

  

* Validates all the csvs have been correctly imported to the database

  
  

## Why Csv2sql ?

  

* Using the power of otp and multiple processes in elixir, Csv2sql does all the tasks
in parallel whether its infering table schemas from csv files or inserting huge csvs into the database, this makes it super fast and efficient.


* When inserting huge files Csv2sql uses multiple processes which inserts multiple portions of the same file
into the database parallely thus improving insertion speeds immensely (35% faster than a script written in other languages)

  

* Csv2sql uses streams, to lazily read huge csv files, thus it has minimal memory footprint

  

* Csv2sql comes with lots of customizable parameters which can be changed to fine tune the application based on requirement. 

* Csv2Sql supports partial operations, so if you only want to generate a schema file or insert data into in already created tables or validate imported data, everthing is possible with csv2sql.

* Csv2Sql can be configured to reduce cpu usage at the cost of slower speed or increase speed at the cost of more cpu usage and database load.

  

* It is completely automatic, provide a path with lots of csvs and start the application, it will handle the rest...


## Run from executable escript

Download the [csv2sql executable escript](https://github.com/Arpan-Kreeti/csv2sql/blob/master/executable/csv2sql.zip).

You must have mysql and erlang installed to run csv2sql...

  
### You must first install erlang

#### Add the erlang repository by..

  

```

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb

sudo dpkg -i erlang-solutions_1.0_all.deb

```

  

#### Install erlang

  

```

sudo apt-get update

sudo apt-get install esl-erlang

```

  
  
  

### Start the app
Start csv2sql by ```./csv2sql --<argument>```

 
### Use command line args

  

You can pass various command line arguments to csv2sql to configure how to process csvs and specify important information.
Any command line argument if specified will override the corresponding environemnt varaible.

A description of all the available command line flags that can be used are given below.

  
  |           Flag          | Description                                                                                                                                                                                                                            | Default value                                                                                                                                       |
|:-----------------------:|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| --schema-file-path        | The location were the generated schema file will be stored                                                                                                                                                                             | If no value is supplied it saves the generated schema file in the same directory as the source csv files specified by "--source-csv-directory" flag |
| --source-csv-directory    | The source directory where the csvs are located                                                                                                                                                                                        | Defaults to the current directory from which the program is run                                                                                                                       |
| --imported-csv-directory  | The directory were the csvs will be moved after importing to database, make sure it is present and is empty                                                                                                                            | (source-csv-directory)/imported                                                                                                                     |
| --validated-csv-directory | The directory were the csvs will be moved after they are validated, make sure it is present and is empty                                                                                                                               | (source-csv-directory)/validated                                                                                                                    |
| --skip-make-schema        | Skip infering schema and makign a schema file                                                                                                                                                                                          | false                                                                                                                                               |
| --skip-insert-schema      | Skip inserting the infered schema in the database. Usefull if the table structures are already present and you only wish to insert data from the csv files.(This will be true automatically if skip-make-schema is used)               | false                                                                                                                                               |
| --skip-insert-data        | Skip inserting data from the csvs                                                                                                                                                                                                      | false                                                                                                                                               |
| --skip-validate-import    | Skip validating the imported data                                                                                                                                                                                                      | false                                                                                                                                               |
| --db-connection-string    | The database connection string in the format username:password@host/database_name                                                                                                                                                      | None, this is compulsary if the operations specified requires database access                                                                       |
| --connection-socket       | The mysql socket file path                                                                                                                                                                                                             | /var/run/mysqld/mysqld.sock                                                                                                                         |
| --varchar-limit           | The value of varchar type, and the limit after which a string is considered a text and not a varchar                                                                                                                                   | 100                                                                                                                                                 |
| --schema-infer-chunk-size | The chunk size to use when the schema fora CSV will be inferred parallelly. For example, a chunk size 100 means the CSV will be read 100 rows at a time and separate processes will be used to infer the schema for each 100-row chunk | 100                                                                                                                                                 |
| --worker-count            | The number of workers, directly related to how many CSVs will be processed parallelly                                                                                                                                                  | 10                                                                                                                                                  |
| --db-worker-count         | The number of database workers, lowering the value will lead to slow performance but lesser load on database, a higher value can lead to too many database connection errors.                                                          | 15                                                                                                                                                  |
| --insertion-chunk-size    | Number of records to insert into the database at once, increasing this may result in mysql error for too many placeholders                                                                                                             | 100                                                                                                                                                 |
| --job-count-limit         | Number of chunks to keep in memory (Memory required=insertion_chunk_size * job_count_limit)                                                                                                                                            | 10                                                                                                                                                  |
| --log                     | Enable ecto logs, to log the queries being executed, possible values are :debug, :info, :warn                                                                                                                                          | false                                                                                                                                               |
| --timeout                 | The time in milliseconds to wait for the query call to finish                                                                                                                                                                          | 60000                                                                                                                                               |
| --connect-timeout         | The number of seconds that the mysqld server waits for a connect packet before responding with Bad handshake                                                                                                                           | 60000                                                                                                                                               |
| --pool-size               | The pool_size controls how many connections you want to the database.                                                                                                                                                                  | 20                                                                                                                                                  |
| --queue-target            | The time to wait for a database connection                                                                                                                                                                                             | 5000                                                                                                                                                |
| --queue-interval          | If all connections checked out during a :queue_interval takes more than :queue_target, then we double the :queue_target.                                                                                                               | 1000                                                                                                                                                |
  

## Examples:

#### Load csvs to database, this will infer the schema, insert the infered schemas to the database, insert the data and then validate data for all the csvs

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --db-connection-string "root:mysql@localhost/test_csv"`

#### Import schema only:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --skip-insert-schema --skip-insert-data --skip-validate-import`


#### Skip validation:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --db-connection-string "root:mysql@localhost/test_csv" --skip-validate-import`

  #### Only validate imported csv
  `./csv2sql --skip-make-schema --skip-insert-data --imported-csv-directory "/home/user/Desktop/imported-csvs" --db-connection-string "root:mysql@localhost/test_csv"`
  

#### Custom path for imported and validated csv files:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --imported-csv-directory "/home/user/Desktop/imported_csvs" --validated-csv-directory "/home/user/Desktop/validated_csvs" --db-connection-string "root:mysql@localhost/test_csv"`

  
  

#### Only infer and create schema but don't insert data:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --skip-insert-data --db-connection-string "root:mysql@localhost/test_csv"`

  
  

#### Change the worker count, setting this to one will lead to processing a single csv at a time, this will be slower but will lead to lower cpu usage:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --db-worker-count 1 --db-connection-string "root:mysql@localhost/test_csv"`

  
  

#### Enable logs, to log the queries being executed:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --log debug --db-connection-string "root:mysql@localhost/test_csv"`

  
  

#### Set the number of workers inserting data into the database, lowering the value will lead to slow performance but lesser load on database, a higher value can lead to too many database connection errors:

`./csv2sql --source-csv-directory "/home/user/Desktop/csvs" --db-worker-count 2 --db-connection-string "root:mysql@localhost/test_csv"`

  
  

### Run using configuration files

 You can use configuration files to specify various arguments or if the number of arguments is very large and difficult to specify as command line arguments.

cd into the directry with the configuration file and csv2sql executable

  

Edit the ```config.env``` file according to your requirments.

  

### Load configurations

  

Load the configurations in ```config.env``` in your current shell session by ```source ./config.env```

  

### Start the app

Start csv2sql by ```./csv2sql```


## Run the app from source code

  
You must have elixir and mysql installed in your system to run Csv2sql.

 

To use the app just clone this repository then edit the ```config.env.sample``` file with correct configurations.

  

Once that is done, source the environment variables by ```source ./config.env.sample```

  

Then start the application by ```iex -S mix```

  

Execute the followinf function to begin the process ```Csv2sql.main(nil)```

  

Thats all !


### Supported data types

As of now csv2sql can map data into one of the following datatypes:

* date
* timestamp
* boolean
* integer
* float
* varchar
* text
  

### Troubleshooting

  

In case you face datatrucation errors or other issues when inserting data, delete the database in which

csv2sql inserts data, so that it will be recreated with correct encoding and collation next time.

By default csv2sql uses ```utf8mb4``` character set and ```utf8mb4_general_ci``` collation when

creating a database.

  

If you face database connection timeout errors try reducing the worker and db_worker count in the configurations

or change the database timeout, pool size and other related database configurations.

  
  

## Further improvements or features to expect...

  

* Support other popular databases like postgres, mssql server, etc