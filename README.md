# README

This README would normally document whatever steps are necessary to get the
application up and running.

Edit/Remove the following sections as you wish.

## System Requirements

- Ruby 2.5.1
- Rails 5.2.1
- Yarn

## Dependencies

### Ruby

    bundle install

### Javascript

    yarn install

## MySQL

    If you're having a problem with MySQL run: brew install mysql
    Then: brew link mysql
    Then: gem install mysql2 --platform=ruby

### System

## Database Management

To setup database you either run:

    bundle exec rails db:setup

or:

    bundle exec rails db:create
    bundle exec rails db:migrate
    bundle exec rails db:seed

### Running migrations

To run migrations use the following command:

    bundle exec rails db:migrate

## Services (job queues, cache servers, search engines, etc.)

## Tests

You should run the tests with the following command:

    bundle exec rake

## Linting

You can lint the code running Rubocop:

    bundle exec rubocop

## Security

Run:

    bundle exec brakeman

## Deployment Instructions

## How to Contribute

## License
