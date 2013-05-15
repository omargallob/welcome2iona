require 'errorapp_notifier'

@config_file = File.join(RAILS_ROOT, "/config/errorapp_notifier.yml")
begin
  if (Rails::VERSION::MAJOR < 3)
    ErrorappNotifier::Config.load(@config_file)
    if ErrorappNotifier::Config.should_send_to_api?
      ErrorappNotifier.logger.info("Loading ErrorappNotifier #{ErrorappNotifier::VERSION} for #{Rails::VERSION::STRING}")
      require File.join('errorapp_notifier', 'integration', 'rails')
    end
  else
    ErrorappNotifier::Config.load(@config_file)
    if ErrorappNotifier::Config.should_send_to_api?
      ErrorappNotifier.logger.info("Loading ErrorappNotifier #{ErrorappNotifier::VERSION} for #{Rails::VERSION::STRING}")
      Rails.configuration.middleware.use "Rack::ErrorMiddleware"
    end
  end
rescue => e
  STDERR.puts "Problem starting ErrorappNotifier. Your app will run as normal. #{e.message}"
  ErrorappNotifier.logger.error(e.message)
  ErrorappNotifier.logger.error(e.backtrace)
end

