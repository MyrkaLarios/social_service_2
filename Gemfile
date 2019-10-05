# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"
gem "rails", "~> 5.2.1"
gem "mysql2", ">= 0.4.4", "< 0.6.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "cocoon"
gem "devise"
gem "devise-i18n"
gem "haml-rails", "~> 2.0"
gem "interactor-rails"
gem "puma", "~> 3.11"
gem "pry-rails"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "simple_form"

# Background Jobs Adapter
gem "sidekiq"



# Test Suite Gem
gem "minitest-rails", group: [:development, :test]

group :development, :test do
  gem "annotate"
  gem "awesome_print"
  gem "pry"
  gem "rubocop-rails_config"
end

group :development do
  gem "brakeman"
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "minitest"
  gem "mocha"
  gem "poltergeist", "~> 1.10.0"
  gem "webmock"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
