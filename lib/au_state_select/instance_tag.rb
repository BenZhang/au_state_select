module AUStateSelect

  module InstanceTag
    def to_state_select_tag(priority_states, html_options = {}, options = {})
      # Rails 4 stores options sent when creating an InstanceTag.
      # Let's use them!
      options = @options if defined?(@options)

      state_select(priority_states, options, html_options)
    end

    # Adapted from Rails country_select. Just uses country codes instead of full names.
    def state_select(priority_states, options, html_options)
      selected = object.send(@method_name) if object.respond_to?(@method_name)

      states = ""

      if options.present? and (options[:include_blank] or (options[:prompt] and !selected))
        if options[:include_blank].present?
          option = options[:include_blank] == true ? "" : options[:include_blank]
        elsif options[:prompt].present?
          option = options[:prompt] == true ? "Please Select" : options[:prompt]
        end
        states += "<option>#{option}</option>\n"
      end

      if priority_states
        states += options_for_select(priority_states, selected)
        states += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
      end
      states = states + options_for_select([['Australian Capital Territory', 'ACT'],['New South Wales', 'NSW'],['Northern Territory', 'NT'],['Queensland', 'QLD'],['South Australia', 'SA'],['Tasmania', 'TAS'],['Victoria', 'VIC'],['Western Australia', 'WA']], selected)

      html_options = html_options.stringify_keys
      add_default_name_and_id(html_options)

      content_tag(:select, states.html_safe, html_options)
    end
  end

end