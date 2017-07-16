source "http://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails','~>5.1.2'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier'
gem 'turbolinks'
gem 'jbuilder'
gem 'jquery-rails'
gem 'simple_form'
gem 'will_paginate'
gem "flat-ui-rails"
gem 'awesome_rails_console'


group :development, :test do
  gem 'sqlite3', '1.3.12'
  gem 'byebug', '9.0.0', platform: :mri
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console', '3.1.1'
  gem 'listen', '>= 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
