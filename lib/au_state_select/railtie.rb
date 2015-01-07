require 'rails/railtie'

module AUStateSelect
  class Railtie < Rails::Railtie
    initializer "au_state_select.configure_rails_initialization" do
      SimpleForm.input_mappings = { /state/ => :state }

      module ::SimpleForm
        mattr_accessor :state_priority
        @@state_priority = nil
        class FormBuilder < ActionView::Helpers::FormBuilder
          map_type :state, to: SimpleForm::Inputs::PriorityInput
        end
      end
    end
  end
end
