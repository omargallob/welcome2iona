$:.unshift File.dirname(__FILE__)

require 'errorapp_notifier/monkeypatches'
require 'errorapp_notifier/catcher'
require 'errorapp_notifier/log_factory'
require 'errorapp_notifier/config'
require 'errorapp_notifier/application_environment'
require 'errorapp_notifier/exception_data'
require 'errorapp_notifier/controller_exception_data'
require 'errorapp_notifier/rack_exception_data'
require 'errorapp_notifier/alert_data'
require 'errorapp_notifier/error_notifier'
require 'errorapp_notifier/integration/rack'
require 'errorapp_notifier/integration/rack_rails'
require 'errorapp_notifier/integration/alerter'
require 'errorapp_notifier/integration/tester'
require 'errorapp_notifier/version'

require 'errorapp_notifier/railtie' if defined?(Rails::Railtie)

module ErrorappNotifier
  PROTOCOL_VERSION = 1
  CLIENT_NAME = 'errorapp_notifier'

  def self.logger
    ::ErrorappNotifier::LogFactory.logger
  end

  def self.configure(api_key)
    ErrorappNotifier::Config.api_key = api_key
  end

  def self.handle(exception, name=nil)
    ErrorappNotifier::Catcher.handle(exception, name)
  end

  def self.rescue(name=nil, context=nil, &block)
    begin
      self.context(context) unless context.nil?
      block.call
    rescue Exception => e
      ErrorappNotifier::Catcher.handle(e,name)
    ensure
      self.clear!
    end
  end

  def self.rescue_and_reraise(name=nil, context=nil, &block)
    begin
      self.context(context) unless context.nil?
      block.call
    rescue Exception => e
      ErrorappNotifier::Catcher.handle(e,name)
      raise(e)
    ensure
      self.clear!
    end
  end

  def self.clear!
    Thread.current[:notifier_context] = nil
  end

  def self.context(hash = {})
    Thread.current[:notifier_context] ||= {}
    Thread.current[:notifier_context].merge!(hash)
    self
  end
end