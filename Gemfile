source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'jsonapi-resources'
gem "active_model_serializers", "~> 0.10.6"
gem 'pg', '0.21.0'
gem 'pg_search', '2.1.0'
gem 'rack-cors'
gem 'devise'
gem 'simple_token_authentication', '~> 1.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry', '0.10.4'
end

group :development do
  gem "letter_opener"
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do 
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'rollbar'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec'
  gem 'rspec-rails', '~> 3.5'
  gem 'timecop'
  gem 'email_spec'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
