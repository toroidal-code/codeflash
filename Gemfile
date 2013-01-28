source 'https://rubygems.org'

# Important stuff
gem 'rails', '3.2.11'
gem 'thin'

# Database
group :production do
	gem 'pg', '~> 0.14'
end
group :development, :test do
	gem 'sqlite3', '~> 1.3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'binding_of_caller', '~> 0.6'
  gem 'better_errors', '~> 0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
