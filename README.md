# Csv2sql


<img src="https://github.com/Arpan-Kreeti/csv2sql/blob/master/repo_image.png"
     alt="csv2sql image"
     style="float: left; margin-right: 10px;" />

## What is Csv2sql ?

Csv2sql is a blazing fast fully automated tool to load huge csv files into a mysql database.

Csv2 sql automatically...

* Reads csv files and infers the database table structure

* Creates the database and the required tables

* Inserts all the csvs into the database

* Validates all the csvs have been correctly imported to the database


## Why Csv2sql ?

* Using the power of otp and multiple processes in elixir, Csv2sql does all the tasks
  in parallel whether its deriving table schemas from csv file or inserting huge csvs into the database

* When inserting huge files Csv2sql uses multiple processes which inserts multiple portions of the same file
  into the database parallely thus improving insertion speeds immensely (35% faster than a script written in other languages)

* Csv2sql uses streams, to lazily read huge csv files, thus it has minimal memory footprint

* Csv2sql comes with lots of customizable parameters which can be changed to fine tune the application based on requirement.
  It can be configured to reduce cpu usage at the cost of slower speed or increase speed at the cost of more cpu usage.

* It is completely automatic, provide a path with lots of csvs and start the application, it will handle the rest...


## Installation


### From executable

Download the [csv2sql executable](https://github.com/Arpan-Kreeti/csv2sql/blob/master/executable/csv2sql.zip).

Extract the zip and follow the instructions in the ```readme.md``` file

### From repository

You must have elixir and mysql installed in your system to run Csv2sql.

To use the app just clone this repository then edit the ```config.env.sample``` file with correct configurations.

Once that is done, source the environment variables by ```source ./config.env.sample```

Then start the application by ```iex -S mix```

Thats all !


## Further improvements or features that might come...

* Make a standalone executable of the application

* Support other popular databases like postgres, mssql server, etc

* Allow users to perform partial tasks only like creating schema, inserting data or validating data.
