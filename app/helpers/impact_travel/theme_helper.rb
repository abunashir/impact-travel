module ImpactTravel
  module ThemeHelper
    def font_awesome(icon_name)
      "<i class='fa #{icon_name}'></i>".html_safe
    end
  end
end
