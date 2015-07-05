# README

This README documents whatever steps are necessary to get the application up and running.

### Ruby version

Ruby-2.2.1

### System dependencies

* MySQL 5.6+
* RVM 1.26+
* Bundler 1.10+

### Configuration

```
$> mysqld
$> git clone git@github.com:michaelminter/beverage-test.git
$> cd beverage-test
$> rvm use ruby-2.2.1@beverage-test --create --ruby-version
$> bundle install
```

### Database creation

```
$> mysql
mysql> CREATE DATABASE beverage-test_development;
mysql> CREATE DATABASE beverage-test_test;
```

### Database initialization

```
$> vim config/database.yml
$> rake db:migrate
```

### Push Notifications

```
$> mv .env.backup .env
$> vim .env
```

Retreive __PUSHER_URL__ from _pusher.com_ in App Settings > App Keys.

### Deployment instructions

```
$> rails start
```

Go to __http://0.0.0.0:3000__.

### Run Simulation

Will similuate orders being purchased and shipped.

View live results from the interface at __http://0.0.0.0:3000__

```
$> rake simulation:start
```

### How to run the test suite

```
$> rake test
```
