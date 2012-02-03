# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Components used by the form builder to generate a complete input. You can remove
  # any of them, change the order, or even add your own components to the stack.
  config.browser_validations = false 
  config.components = [ :placeholder, :label, :hint, :input, :preview, :error ]
  

end
 
 require 'simple_form/preview_component.rb'