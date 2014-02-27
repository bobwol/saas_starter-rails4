source 'https://code.stripe.com' # Only trust Stripe gem from Stripe
source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=saas_starter

# Default Rails gems
gem 'rails', '4.0.2'
gem 'coffee-rails', '~> 4.0.1' # Use CoffeeScript for .js.coffee assets and views
gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails', '3.0.4' # Use jquery as the JavaScript library
gem 'sass-rails', '~> 4.0.1' # Use SCSS for stylesheets
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'uglifier', '>= 2.1.1' # Use Uglifier as compressor for JavaScript assets

# Project specific gems
gem 'thin' # Web server (used for Heroku, also look into Unicorn)
gem 'high_voltage', '~> 2.1.0' # Rails eengine for static pages
gem 'devise' # User authentication
gem 'pundit' # User authorization
gem 'figaro' # Environment variables configurer
gem 'stripe' # Stripe payment API
gem 'redcarpet' # Markdown renderer

group :production do
  gem 'pg', '~> 0.17.0' # Database for Heroku
  gem 'rails_12factor', '0.0.2' # Heroku support
end

group :development, :test do
  gem 'sqlite3', '1.3.8' # Database for simple local development
  gem 'quiet_assets', '1.0.2' # Turn off assets log
  gem 'rspec-rails', '2.14.1' # Testing framework for Rails
end

group :test do
  gem 'selenium-webdriver', '2.35.1' # Interacts with HTML for testing
  gem 'capybara', '~> 2.2.1' # DSL for making tests more readable
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
