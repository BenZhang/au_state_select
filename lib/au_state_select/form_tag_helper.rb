module AUStateSelect
  module FormTagHelper
    def state_select_tag(name, priority_countries = nil, options = {}, html_options = {})

      states = ""

      if options.present? and (options[:include_blank] or (options[:prompt]))
        if options[:include_blank].present?
          option = options[:include_blank] == true ? "" : options[:include_blank]
        elsif options[:prompt].present?
          option = options[:prompt] == true ? "Please Select" : options[:prompt]
        end
        states += "<option>#{option}</option>\n"
      end

      select_options = if options.key?(:short_name) and options[:short_name]
        ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']
      else
        [['Australian Capital Territory', 'ACT'],['New South Wales', 'NSW'],['Northern Territory', 'NT'],['Queensland', 'QLD'],['South Australia', 'SA'],['Tasmania', 'TAS'],['Victoria', 'VIC'],['Western Australia', 'WA']]
      end
      states = states + options_for_select(select_options)

      html_options = html_options.stringify_keys

      attribute_id = options[:id] || name

      content_tag(:select, states.html_safe, { "name" => name, "id" => sanitize_to_id(attribute_id) }.update(html_options.stringify_keys))
    end
  end
end