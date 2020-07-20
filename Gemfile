# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) {|repo_name| 'https://github.com/#{repo_name}' }

gem 'puma'
gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'

gem 'i18n'
gem 'config'

gem 'pg'
gem 'sequel'

gem 'dry-initializer'
gem 'dry-validation'

gem 'activesupport'
gem 'jsonapi-serializer'

gem 'sequel_secure_password'

group :development do
  gem 'byebug'
end

group :test do
  gem 'rspec'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'database_cleaner-sequel'
end
