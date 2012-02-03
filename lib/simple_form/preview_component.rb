module SimpleForm 
  module Components 
    module Preview 
      def preview 
        if input_type == :file
          template.image_tag(object.send("#{attribute_name}_url"), :class => 'file_preview', :width=>200) if object.send("#{attribute_name}?")
        end
      end 
    end 
  end 
  module Inputs 
    class Base 
      include SimpleForm::Components::Preview 
    end 
  end 
end