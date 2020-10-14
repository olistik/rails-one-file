require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'rails'
  gem 'rack'
  gem 'puma'
end

require 'rack'
require 'rack/handler/puma'

# In config/application.rb, normally we require rails/all
# Instead, we'll only require what we need:
require 'action_controller/railtie'

class TinyApp < Rails::Application
  config.eager_load = true # necessary to silence warning
  config.api_only = true # removes middleware we dont need
  config.logger = Logger.new($stdout)
  Rails.logger  = config.logger
  config.secret_key_base = ENV['SECRET_KEY_BASE'] # Rails won't boot w/o a secret token for session, cookies, etc.
  routes.append { get '/welcome' => 'welcome#show' }
end

class WelcomeController < ActionController::Base
  def show
    render json: { message: 'Hello' }
  end
end

# Initialize the app (originally in config/environment.rb)
TinyApp.initialize!

# Run it (originally in config.ru)
Rack::Handler::Puma.run TinyApp
