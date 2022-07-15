source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use HTTParty for making HTTP requests
gem "httparty", "~> 0.20.0"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", "~> 11.1"
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem "pry", "~> 0.14.1"
  # Environment variable loading https://github.com/bkeepers/dotenv
  gem "dotenv-rails", "~> 2.7"
  # RSpec static linting https://github.com/rubocop-hq/rubocop
  gem "rubocop", "~> 1.27"
  # RSpec Testing https://github.com/rspec/rspec-rails
  gem "rspec-rails", "~> 5.1"
  # RSpec extension https://github.com/rubocop-hq/rubocop-rspec
  gem "rubocop-rspec", "~> 2.9"
  # A Ruby library that pretty prints Ruby objects
  gem "amazing_print", "~> 1.4"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # Use for documenting Rails Model, Routes, etc.
  gem 'annotate'
  # Used for running bin/dev
  gem "foreman", "~> 0.87.2"
end

gem "pagy", "~> 5.10"
