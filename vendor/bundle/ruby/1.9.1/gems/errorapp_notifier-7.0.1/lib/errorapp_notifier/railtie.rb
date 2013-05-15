require 'errorapp_notifier'
require 'rails'

module ErrorappNotifier
  class Railtie < Rails::Railtie

    initializer "notifier.middleware" do |app|
      ErrorappNotifier::Config.load(File.join(Rails.root, "/config/errorapp_notifier.yml"))
      if ErrorappNotifier::Config.should_send_to_api?
        ErrorappNotifier.logger.info("Loading ErrorappNotifier #{ErrorappNotifier::VERSION} for #{Rails::VERSION::STRING}")
        app.config.middleware.use "Rack::ErrorMiddleware"
      end
    end
  end
end
