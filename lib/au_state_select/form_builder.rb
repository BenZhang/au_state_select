module AUStateSelect
  module FormBuilder
    def state_select(method, priority_countries = nil, options = {}, html_options = {})
      @template.state_select(@object_name, method, priority_countries, options.merge(object: @object), html_options)
    end
  end
end