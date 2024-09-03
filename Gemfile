source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.0.8'
gem 'vite_rails'
gem 'committee'
gem 'committee-rails', '~> 0.6.1'
gem 'ulid'
gem 'interactor', '~> 3.0'
gem 'interactor-rails', '~> 2.0'
gem 'resque'
gem 'alba'
gem 'redis', '~> 4.8'

gem 'bootsnap', require: false
gem 'jbuilder'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'coveralls_reborn', require: false
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'prettier_print'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop', '~> 1.42', require: false
  gem 'simplecov'
  gem 'syntax_tree'
  gem 'webmock'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
