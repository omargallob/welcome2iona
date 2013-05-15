require 'rubygems'
require 'rack'

module Rack
  class ErrorMiddleware    

    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        body = @app.call(env)
      rescue Exception => e
        ::ErrorappNotifier::Catcher.handle_with_controller(e,env['action_controller.instance'], Rack::Request.new(env))
        raise
      end

      if env['rack.exception']
        ::ErrorappNotifier::Catcher.handle_with_controller(env['rack.exception'],env['action_controller.instance'], Rack::Request.new(env))
      end

      body
    end
  end
end
