source 'https://rubygems.org'

# Rails 4
gem 'rails', '~> 4.0'
#gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'
gem 'journey'
gem 'rails-perftest'

# Server
gem 'puma'

# Database
gem 'pg', '~> 0.14'

# Controllers
gem 'high_voltage', '~> 1.2'
gem 'gravatar-ultimate'

# Auth
gem 'omniauth-github', '~> 1.1.0'
gem 'devise', github: 'idl3/devise', branch: 'rails4'
gem 'cancan', '~> 1.6.9'

# Deploying
gem 'capistrano'
gem 'rvm-capistrano'

# Required by rake for RAILS_ENV=production, thus outside :assets
gem 'yard', '~> 0.8.6.1'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'rdoc'

# Pygments, using DHowett's fork (updated to pygments 1.6) until tmm1 approves the pull request.
gem 'pygments.rb'

# Required by methods called inside RAILS_ENV=production
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'

# Gems used for assets.
gem 'historyjs-rails'
gem 'yui-compressor'
gem 'closure-compiler'
gem 'sass-rails'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'ace-rails-ap'
gem 'select2-rails'
gem 'holder_rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development do
  gem 'binding_of_caller', '~> 0.6'
  gem 'better_errors', '~> 0.7'
  gem 'foreman'
  gem 'yard-activerecord', '~> 0.0.8'
  gem 'redcarpet'
end

group :test do
  #gem 'simplecov', require: false
end

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Coveralls for code coverage
gem 'coveralls', require: false

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use debugger
# gem 'debugger'
