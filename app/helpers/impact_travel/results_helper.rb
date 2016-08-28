module ImpactTravel
  module ResultsHelper
    def show_star_filtering(number)
      output  = "<ul class='starts'>"
      output += "<li><input type='checkbox' name='stars[]'"
      output += "value='#{number}' #{check_star_selection(number)}></li>"
      number.times do
        output += "<li><a href='#'><i class='fa fa-star'></i></a></li>"
      end
      output += "<li><span>#{pluralize(number, 'star')}</span></li></ul>"

      raw(output)
    end

    def show_property_type_checkboxes(name, number)
      raw build_filtering_options(
        "property_types", name, number, check_property_selection(number)
      )
    end

    def show_hotel_amenities(name, number)
      raw build_filtering_options(
        "amenities", name, number, check_amenities_selection(number)
      )
    end

    def build_filtering_options(option_type, name, number, selection_status)
      output  = "<div class='checkbox'><label>"
      output += "<input type='checkbox' name='#{option_type}[]' "
      output += "value='#{number}' #{selection_status} />"
      output += "#{name}</label>"
      output
    end

    def check_selection(field, num)
      if field
        selections = field
        return selections.include?(num.to_s) ? "checked" : ""
      end
    end

    def check_property_selection(num)
      check_selection(params[:property_types], num)
    end

    def check_star_selection(num)
      check_selection(params[:stars], num)
    end

    def check_amenities_selection(num)
      check_selection(params[:amenities], num)
    end
  end
end
