require 'rubygems'
require 'rack'

module Rack
  class Notifier    

    def initialize(app, api_key = nil)
      @app = app
      if api_key.nil?
        notifier_config = "config/errorapp_notifier.yml"
        ::ErrorappNotifier::Config.load(notifier_config)
      else
        ::ErrorappNotifier.configure(api_key)
        ::ErrorappNotifier::Config.enabled = true
        ::ErrorappNotifier.logger.info "Enabling ErrorappNotifier for Rack"
      end
    end

    def call(env)
      begin
        status, headers, body =  @app.call(env)
      rescue Exception => e
        ::ErrorappNotifier::Catcher.handle_with_rack(e,env, Rack::Request.new(env))
        raise(e)
      end
    end
  end
end
