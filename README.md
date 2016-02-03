# big_data_related
The Script for Getting of much infomation technology and more bigdata.

## Recommend of your environment or version
* Ruby 2.3.0
* MySQL 5.7.10

## To Use this technology for this library.
* GitHub API v3.0 (Required OAuth)

## First, to bundle on this repository.

```.sh
bundle install --path vendor/bundler
```

## Second, to construct database.

1. Construct MySQL.
2. Run for [`ddl.sql`](https://github.com/pollseed/big_data_related/blob/master/sql/ddl.sql)

## Finally, to launch script file.


### Get more than 10000 of programing languages
* To take 3 hours and half hours
* 14029 items (2016/2/2 time)

```.sh
cd big_data_related/scripts
ruby batch.rb
```

### Get indivisually
Need to add `Requesu.new.argv_run` to request.rb.

#### Syntax
`ruby request.rb {language name} {page} {limit}`

```.sh
cd big_data_related/scripts

ruby request.rb java 1 100
ruby request.rb ruby 1 500
ruby request.rb python 2 50
ruby request.rb go 1 30
ruby request.rb javascript 1 1000
```
