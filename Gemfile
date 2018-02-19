source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Postgres
gem 'pg', '~> 0.18'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem "rb-readline"

# Front-End
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'modernizr-rails'
gem 'meta-tags', require: 'meta_tags'
gem 'responders', '~> 2.0'
gem 'bh'
## Enables simple forms from Bootstrap
gem 'simple_form'
gem 'premailer-rails'
## Geolocater
gem 'geocoder'
## React.js
# gem "react_on_rails", "~> 6"
## Google's map embedded on screen
gem 'gmaps4rails'
gem 'mini_racer', platforms: :ruby
## CitiBikes API
gem 'citybikes_api', '~> 2.0'

# Authentication
gem 'devise', '~> 4.2'
gem 'omniauth'
gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'omniauth-instagram'

# Social Media Identity
gem 'google-api-client', '0.8.2', require: 'google/api_client'
gem 'twitter'
gem 'instagram'

# Back End
## HTML/XML Parser
gem 'nokogiri'
gem 'fuzzy-string-match'
## Caching with redis
gem 'redis-rails'
gem 'redis-namespace'
gem 'rack-mini-profiler'
## Asset Pipeline (usually in the manifest.js but is a dependancy for gmaps4rails)
gem 'underscore-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'happy_seed'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'haml-rails'
group :development, :test do
  gem 'rspec', '~> 3.5.0'
  gem 'rspec-rails', '~> 3.5.0'
  # gem 'factory_girl_rails'
  gem 'capybara'
  gem 'cucumber-rails', require: false
  gem 'guard-rspec', '~> 4.6.4', require: false
  gem 'guard-cucumber'
  gem 'database_cleaner'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'launchy'
  gem 'vcr'
  gem 'faker'
  gem 'dotenv-rails'
  gem 'rdiscount'
  gem 'rails-controller-testing'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platform: :mri
end

group :test do
  gem 'webmock'
  gem 'fakeredis', require: 'fakeredis/rspec'
end

group :production do
  gem 'rails_12factor'
  gem 'lograge'
end
