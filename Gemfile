source 'https://rubygems.org'

ruby '2.3.7'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use Bootstrap from Twitter Framework
gem 'bootstrap-sass', '>=2.3.2.0'

# use password hash cryption module 
# gem 'bcrypt-ruby', '>=3.0.1'
gem 'bcrypt'

# use web crawler nokogiri 
gem 'nokogiri', '1.6.3.1'
gem 'mechanize'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-datatables-rails', '~> 2.1.10.0.3'
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'rails_12factor'

gem 'friendly_id'

gem 'simple_form'

# login function 
gem 'devise'
# Use Omniauth
gem 'omniauth-github', github: 'intridea/omniauth-github'
gem 'omniauth-facebook'

# Use Figaro manage auth_key & auth_secret
gem 'figaro'

gem 'whenever'

gem 'rake'
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3" , '>=1.3.6'
  gem "rspec-rails" , '>= 2.0.0' 
  gem 'guard-rspec', '>=2.5.0'
  gem 'spork-rails', '>=4.0.0'
  gem 'guard-spork', '>=1.5.0'
  gem 'childprocess', '>=0.3.6'
end

group :test do
  gem 'selenium-webdriver', '>=2.35.1'
  gem 'capybara', '>=2.1.0'
  gem 'factory_girl_rails', '>=4.2.1'
end




# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
