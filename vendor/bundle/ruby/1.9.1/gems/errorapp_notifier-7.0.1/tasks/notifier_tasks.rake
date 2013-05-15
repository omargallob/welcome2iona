namespace :errorapp_notifier do
  desc 'Send a test exception to Errorapp.'
  task :test => :environment do
    unless ErrorappNotifier::Config.api_key.blank?
      puts "Sending test exception to Errorapp."
      require "errorapp_notifier/integration/tester"
      ErrorappNotifier::Integration.test
      puts "Sent."
    end
  end
end