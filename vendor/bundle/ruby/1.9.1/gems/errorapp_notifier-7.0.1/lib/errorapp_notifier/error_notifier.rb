require 'zlib'
require 'cgi'
require 'net/http'
require 'net/https'
require 'digest/md5'

module ErrorappNotifier
  class ErrorNotifier
    class << self
      def send_error(exception_data)
        uniqueness_hash = exception_data.uniqueness_hash
        hash_param = uniqueness_hash.nil? ? nil: "&hash=#{uniqueness_hash}"
        url = "/api/projects/#{::ErrorappNotifier::Config.api_key}/fails?protocol_version=#{::ErrorappNotifier::PROTOCOL_VERSION}#{hash_param}"
        data = Zlib::Deflate.deflate(exception_data.to_json, Zlib::SYNC_FLUSH)
        call_remote(url, data)
      end

      def call_remote(url, data)
        config = ErrorappNotifier::Config
        optional_proxy = Net::HTTP::Proxy(config.http_proxy_host,
                                          config.http_proxy_port,
                                          config.http_proxy_username,
                                          config.http_proxy_password)
        client = optional_proxy.new(config.remote_host, config.remote_port)
        client.open_timeout = config.http_open_timeout
        client.read_timeout = config.http_read_timeout
        client.use_ssl = config.ssl?
        client.verify_mode = OpenSSL::SSL::VERIFY_NONE if config.ssl?
        begin
          response = client.post(url, data)
          case response
            when Net::HTTPSuccess
              ErrorappNotifier.logger.info( "#{url} - #{response.message}")
              return true
            else
              ErrorappNotifier.logger.error("#{url} - #{response.code} - #{response.message}")
          end
        rescue Exception => e
          ErrorappNotifier.logger.error('Problem notifying Errorapp about the error')
          ErrorappNotifier.logger.error(e)
        end
        nil
      end
    end
  end
end
