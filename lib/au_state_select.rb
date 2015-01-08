require "au_state_select/version"

module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using state_options_for_select to generate the list of option tags.
      def state_select(object, method, priority_states = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_state_select_tag(priority_states, options, html_options)
      end
      # Returns a string of option tags for pretty much any state in the world. Supply a state name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_states+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def state_options_for_select(selected = nil, priority_states = nil)
        state_options = ""

        if priority_states
          if (unlisted = priority_states - AU_STATES).any?
            raise RuntimeError.new("Supplied priority countries are not in the main list: #{unlisted}")
          end
          state_options += options_for_select(priority_states, selected)
          state_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"

          # prevents selected from being included twice in the HTML which causes
          # some browsers to select the second selected option (not priority)
          # which makes it harder to select an alternative priority state
          selected = nil if priority_states.include?(selected)
        end

        state_options = state_options.html_safe if state_options.respond_to?(:html_safe)

        return state_options + options_for_select(AU_STATES, selected)
      end

      # All the countries included in the state_options output.
      AU_STATES = [['Australian Capital Territory', 'ACT'],['New South Wales', 'NSW'],['Northern Territory', 'NT'],['Queensland', 'QLD'],['South Australia', 'SA'],['Tasmania', 'TAS'],['Victoria', 'VIC'],['Western Australia', 'WA']] unless const_defined?("AU_STATES")
    end

    class InstanceTag
      def to_state_select_tag(priority_states, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            state_options_for_select(value, priority_states),
            options, value
          ), html_options
        )
      end
    end

    class FormBuilder
      def state_select(method, priority_states = nil, options = {}, html_options = {})
        @template.state_select(@object_name, method, priority_states, options.merge(:object => @object), html_options)
      end
    end
  end
end

require 'au_state_select/railtie' if defined?(Rails) and defined?(SimpleForm)