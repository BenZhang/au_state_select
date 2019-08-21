module AUStateSelect
  module TagHelper
    def state_option_tags
      # In Rails 5.2+, `value` accepts no arguments and must also be called
      # called with parens to avoid the local variable of the same name
      # https://github.com/rails/rails/pull/29791
      selected_option = @options.fetch(:selected) do
        if self.method(:value).arity == 0
          value()
        else
          value(@object)
        end
      end

      option_tags_options = {
        :selected => selected_option,
        :disabled => @options[:disabled]
      }
      option_tags = options_for_select(state_options, option_tags_options)
    end

    private
    def locale
      @options[:locale]
    end

    def priority_states
      @options[:priority_states]
    end

    def priority_countries_divider
      @options[:priority_countries_divider] || "-"*15
    end

    def only_country_codes
      @options[:only]
    end

    def except_country_codes
      @options[:except]
    end

    def format
      @options[:format] || :default
    end

    def state_options
      if @options.key?(:short_name) && @options[:short_name]
        ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']
      else
        [['Australian Capital Territory', 'ACT'],['New South Wales', 'NSW'],['Northern Territory', 'NT'],['Queensland', 'QLD'],['South Australia', 'SA'],['Tasmania', 'TAS'],['Victoria', 'VIC'],['Western Australia', 'WA']]
      end
    end

    def html_safe_newline
      "\n".html_safe
    end
  end
end