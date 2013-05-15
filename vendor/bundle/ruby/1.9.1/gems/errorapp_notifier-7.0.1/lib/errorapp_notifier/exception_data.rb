require 'digest/md5'
require 'time'

module ErrorappNotifier
  class ExceptionData

    def initialize(exception, name=nil)
      @exception = exception
      @name = name
    end

    def to_hash
      hash = ::ErrorappNotifier::ApplicationEnvironment.to_hash(framework)
      hash.merge!({
        'exception' => {
          'exception_class' => @exception.class.to_s,
          'message' => @exception.message,
          'backtrace' => @exception.backtrace,
          'occurred_at' => Time.now.utc.iso8601
        }
      })
      hash.merge!(extra_stuff)
      hash.merge!(context_stuff)
      self.class.sanitize_hash(hash)
    end

    def extra_stuff
      { 'rescue_block' => { 'name' => @name} }
    end

    def context_stuff
      context = Thread.current[:notifier_context]
      (context.nil? || context.empty?) ? {} : {'context' => context}
    end

    def to_json
      begin
        ActiveSupport::JSON.encode(to_hash)
      rescue NoMethodError
        begin
          require 'json'
          return ActiveSupport::JSON.encode(to_hash)
        rescue StandardError => e
          ErrorappNotifier.logger.error(e.message)
          ErrorappNotifier.logger.error(e.backtrace)
          raise StandardError.new("You need a json gem/library installed to send errors to ErrorappNotifier (Object.to_json not defined). \nInstall json_pure, yajl-ruby, json-jruby, or the c-based json gem")
        end
      end
    end
    
    def uniqueness_hash
      return nil if (@exception.backtrace.nil? || @exception.backtrace.empty?)
      Digest::MD5.hexdigest(@exception.backtrace.join)
    end

    def framework
      nil
    end

    def self.sanitize_hash(hash)

      case hash
        when Hash
          hash.inject({}) do |result, (key, value)|
            result.update(key => sanitize_hash(value))
          end
        when Array
          hash.collect{|value| sanitize_hash(value)}
        when Fixnum, String, Bignum
          hash
        else
          hash.to_s
      end
    rescue Exception => e
      ErrorappNotifier.logger.error(hash)
      ErrorappNotifier.logger.error(e.message)
      ErrorappNotifier.logger.error(e.backtrace)
      {}
    end

    def extract_http_headers(env)
      headers = {}
      env.select{|k, v| k =~ /^HTTP_/}.each do |name, value|
        proper_name = name.sub(/^HTTP_/, '').split('_').map{|upper_case| upper_case.capitalize}.join('-')
        headers[proper_name] = value
      end
      unless headers['Cookie'].nil?
        headers['Cookie'] = headers['Cookie'].sub(/_session=\S+/, '_session=[FILTERED]')
      end
      headers
    end

    def self.sanitize_session(request)
      session_hash = {'session_id' => "", 'data' => {}}

      if request.respond_to?(:session)
        session = request.session
        session_hash['session_id'] = request.session_options ? request.session_options[:id] : nil
        session_hash['session_id'] ||= session.respond_to?(:session_id) ? session.session_id : session.instance_variable_get("@session_id")
        session_hash['data'] = session.respond_to?(:to_hash) ? session.to_hash : session.instance_variable_get("@data") || {}
        session_hash['session_id'] ||= session_hash['data'][:session_id]
        session_hash['data'].delete(:session_id)
      end

      self.sanitize_hash(session_hash)
    end
  end
end
