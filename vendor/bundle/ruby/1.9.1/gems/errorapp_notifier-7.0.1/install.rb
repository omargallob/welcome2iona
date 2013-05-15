require 'fileutils'

config_file = File.expand_path("#{File.dirname(__FILE__)}/../../../config/errorapp_notifier.yml")
example_config_file = "#{File.dirname(__FILE__)}/errorapp_notifier.yml"

if File::exists? config_file
  puts "ErrorAppNotifier config file already exists."
  puts "See #{example_config_file}"
else
  puts "Installing default ErrorAppNotifier config."
  puts "  From #{example_config_file}"
  puts "For errorapp_notifier to work you need to configure your API key."
  puts "  See #{example_config_file}"
  puts "If you don't have an API key, get one at http://errorapp.com/."
  FileUtils.copy example_config_file, config_file
end
