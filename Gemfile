source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Mongo Database
gem 'mongoid', '~> 6.0.0'

# Image manipulation.
gem 'mini_magick'

# Http requests and stubs.
gem 'typhoeus'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'codacy-coverage', require: false
  gem 'rspec-rails', '~> 3.5'
  gem 'simplecov'
end

group :test do
  gem 'capybara'
  gem 'factory_girl', '~> 4.0'
  gem 'json_spec'
  gem 'poltergeist', '~> 1.4'
  gem 'timecop', '~> 0.6'
  gem 'zonebie'

  gem 'rspec_junit_formatter'

  # for client integration
  gem 'vcr', '~> 2.9'
  gem 'webmock', '~> 1.17'

  gem 'codeclimate-test-reporter', require: false
  gem 'rack_session_access'

  gem 'shoulda-matchers'
end
group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'rubycritic', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
