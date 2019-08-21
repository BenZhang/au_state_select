module AUStateSelect
  module FormBuilder
    def state_select(method, priority_state = nil, options = {}, html_options = {})
      if Hash === priority_or_options
        html_options = options
        options = priority_or_options
      else
        options[:priority_state] = priority_or_options
      end

      @template.country_select(@object_name, method, objectify_options(options), @default_options.merge(html_options))
    end
  end
end