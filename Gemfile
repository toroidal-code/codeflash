source 'https://rubygems.org'

# Rails 4
gem 'rails', '~> 4.0'
gem 'journey'
gem 'rails-perftest'

# Server (using github until gem is fully functional again)
gem 'puma', github: 'puma/puma'

# Database
gem 'pg', '~> 0.14'

# Memcached
gem 'dalli'
gem 'kgio' # improves Dalli's performance

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

# Rendering
gem 'multi_fetch_fragments'

# Required by rake for RAILS_ENV=production
gem 'yard', '~> 0.8.6.2'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'rdoc', '~> 4.0.1'

# Pygments
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
gem 'redcarpet'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development do
  gem 'binding_of_caller', '~> 0.6'
  gem 'better_errors', '~> 0.7'
  gem 'foreman'
  gem 'yard-activerecord', '~> 0.0.8'
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
