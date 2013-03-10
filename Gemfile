source 'http://rubygems.org'

# Rails 4
gem 'rails', github: 'rails/rails'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'
gem 'journey', github: 'rails/journey'

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
gem 'yard', '~> 0.8.5.2'
gem 'simple_form', github: 'plataformatec/simple_form'

# Pygments, using DHowett's fork (updated to pygments 1.6) until tmm1 approves the pull request.
gem 'pygments.rb'

# Required by methods called inside RAILS_ENV=production
gem 'will_paginate'
gem 'bootstrap-will_paginate'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'historyjs-rails'
  gem 'yui-compressor'
  gem 'closure-compiler'
  gem 'sass-rails', github: 'rails/sass-rails'
  gem 'bootstrap-sass', '~> 2.3'
  gem 'coffee-rails', github: 'rails/coffee-rails'
  gem 'jquery-rails', '~> 2.2.1'
  gem 'ace-rails-ap'
  gem 'chosen-rails'
  gem 'holder_rails'
  gem 'font-awesome-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
end

group :development do
  gem 'binding_of_caller', '~> 0.6'
  gem 'better_errors', '~> 0.7'
  gem 'foreman'
  gem 'yard-activerecord', '~> 0.0.8'
  gem 'redcarpet'
end

group :test do
  gem 'simplecov', require: false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'
