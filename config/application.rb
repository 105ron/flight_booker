require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlightBooker
  class Application < Rails::Application
  	config.active_record.time_zone_aware_types = [:time, :datetime] #to remove depreciation warning
    config.action_mailer.default_url_options = { host: "https://secure-depths-25814.herokuapp.com" }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
