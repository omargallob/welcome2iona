module ErrorappNotifier
  class Alert <StandardError;
  end

  module Integration
    def self.alert(msg, env={})
      return ErrorappNotifier::ErrorNotifier.send_error(ErrorappNotifier::AlertData.new(Alert.new(msg), "Alert"))
    end
  end
end
