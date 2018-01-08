source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'pg'
gem 'puma'

##########
# Assets #
##########

# Semantic UI CSS framework
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
# SASS CSS preprocessor
gem 'sass-rails'
# For write CSS without browser-specific prefixes
gem 'autoprefixer-rails'

# For hot preloading pages
gem 'turbolinks'

# For embedded V8 for ruby
gem 'therubyracer', platforms: :ruby

# JS uglifier
gem 'uglifier'
# JQuery JS framework
gem 'jquery-rails'
# For fix compability
gem 'browserify-rails'
# React JS framework
gem 'react-rails', github: 'reactjs/react-rails'

# Email templater
gem 'inky-rb', require: 'inky'
gem 'premailer-rails'

# Add SEO Meta tags
gem 'meta-tags'

# to DRY controllers
gem 'responders'
gem 'decent_decoration'
gem 'decent_exposure'
gem 'draper' # to decorate models for views

# encapsulates application's business logic
gem 'interactor'

# encapsulates authorization logic
gem 'pundit'

# exception notification
gem 'rollbar'

# JBuilder JSON templater
gem 'jbuilder'

# Slim templater for HTML
gem 'slim-rails'

# Add checker for life checks
gem 'health_check'

# For loading and processing images
gem 'carrierwave'
gem 'mini_magick'

# For sending data directly to js from rails
gem 'gon'

# For pagination
gem 'kaminari'

# For faster JSON
gem 'oj'

# File validators
gem 'file_validators'

# Full text search engine Sphinx
gem 'thinking-sphinx'
gem 'mysql2',     :platform => :ruby
gem 'jdbc-mysql', :platform => :jruby

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Devise - for authentification, registration, etc with Users
gem 'devise'

##############
# Monitoring #
##############

# Memory profiler
gem 'memory_profiler'

# Graphic profiler
gem 'flamegraph'
gem 'stackprof'

group :development do
  # for checking application for common security vulnerabilities
  gem 'brakeman'

  # for detecting N+1 queries and unused eager loading
  gem 'bullet'

  # for scanning the Gemfile for insecure dependencies based on published CVEs
  gem 'bundler-audit'

  # For directly open emails (not send)
  gem 'letter_opener'

  # For generating
  gem 'rails-erd'

  # For custom rails console
  gem 'pry-rails'

  # Rails web console
  gem 'web-console'

  # For generate HTML documentation
  gem 'rdoc'

  # Preloading and hot reloading from source server
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "awesome_print"
end

group :test do

  ###########
  # Linters #
  ###########

  # Linter for *.rb files
  gem 'rubocop', require: false

  # Linter for *.slim files
  gem 'slim_lint', require: false

  # Linter for *.sass files
  gem 'scss_lint', require: false

  # Code climate checker
  gem 'codeclimate-test-reporter', require: false

  # Database cleaner
  gem 'database_cleaner'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'formulaic' # For easy inputting
  gem 'poltergeist' # For phantomJS
  gem 'selenium-webdriver'

  # For testing mailers
  gem 'email_spec'

  # For mock HTTP requests
  gem 'webmock', require: false

  # For complexer and shorter tests
  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :staging, :production do
  # Performance checker
  gem 'newrelic_rpm'
end

group :production do
  # Resque - Redis based tasks queue
  gem 'resque'
  gem 'resque-scheduler'
  gem 'redis'
end
