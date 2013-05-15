module ErrorappNotifier
  class NotifierTestException <StandardError;
  end
  module Integration
    def self.test_me
      begin
        raise NotifierTestException.new, 'Test exception'
      rescue Exception => e
        unless ErrorappNotifier::ErrorNotifier.send_error(ErrorappNotifier::ExceptionData.new(e, "Test Exception"))
          puts "Problem sending exception to Errorapp. Check your API key."
        else
          puts "Test Exception sent. Please login to http://errorapp.com to see it!"
        end
      end
    end

  end
end
