require "au_state_select/version"
require "au_state_select/form_helpers"
require "au_state_select/form_tag_helper"
require "au_state_select/instance_tag"
require "au_state_select/form_builder"

ActionView::Base.send(:include, AUStateSelect::FormHelpers)
ActionView::Base.send(:include, AUStateSelect::FormTagHelper)

if Rails::VERSION::MAJOR >= 4
  ActionView::Helpers::ActiveModelInstanceTag.send(:include, AUStateSelect::InstanceTag)
else
  ActionView::Helpers::InstanceTag.send(:include, AUStateSelect::InstanceTag)
end
ActionView::Helpers::FormBuilder.send(:include, AUStateSelect::FormBuilder)

require 'au_state_select/railtie' if defined?(Rails) and defined?(SimpleForm)