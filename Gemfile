source 'https://rubygems.org'

ruby '2.5.3'


gem 'rake', '< 11.0'

gem 'devise', '>= 4.4.2'
gem 'devise-i18n'

gem 'omniauth-github', github: 'intridea/omniauth-github'
gem 'omniauth-openid', github: 'intridea/omniauth-openid'
gem 'omniauth-twitter'
gem 'omniauth-strava'
gem 'omniauth-google'

gem 'puma'
gem 'strava-api-v3'
gem 'httparty'

# Bundle edge Rails instead: gem 'rails', '>= 5.2.4.3', github: 'rails/rails'
gem 'rails'
gem 'pg'

# Include 'rails_12factor' gem to enable all platform features
# See https://devcenter.heroku.com/articles/rails-integration-gems for more information.
gem 'rails_12factor'

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.3.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7', '>= 2.7.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'rails-i18n', '~> 5.0.0' # For 4.0.x


gem 'slim-rails', '>= 3.1.3'
gem 'slim'
gem 'sass-rails', '>= 5.0.6'
gem 'bootstrap-sass', '~> 3.3.6'

gem 'fabrication'
gem 'brakeman', :require => false
gem 'react-rails', '~> 1.11', '>= 1.11.0'
gem 'faker'

gem 'mixpanel-ruby'
gem 'mini_magick'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0.2'
  gem 'email_spec'
  gem 'railroady'
  gem 'rubocop'
end

group :test do
  gem 'database_cleaner'
end

gem 'fog-aws', group: :production
gem 'carrierwave', '~> 1.2', '>= 1.2.1'


group :assets do
  gem 'therubyracer'
	# gem 'sass-rails', '>= 3.2'
	gem 'uglifier', '>= 1.3.0'
end


group :development do
  gem 'guard'
  gem 'guard-rspec', require: false


  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.3', '>= 2.3.0'
  gem 'better_errors'
  #gem 'quiet_assets'
  gem 'annotate', '>= 2.7.2'


  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '>= 2.0.2'
end

gem 'newrelic_rpm'
gem "bower-rails", "~> 0.10.0"

gem 'exception_notification', '>= 4.2.2'


