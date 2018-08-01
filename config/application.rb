require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Aeroclass
  class Application < Rails::Application
    config.time_zone = 'Santiago'
  	config.i18n.default_locale = :es
	  config.to_prepare do
      Devise::SessionsController.layout proc{ |controller| action_name == 'new' ? "login"   : "application" }
      Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
      
  	end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
