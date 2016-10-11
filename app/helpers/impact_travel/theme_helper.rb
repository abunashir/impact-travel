module ImpactTravel
  module ThemeHelper
    def app_theme
      @app_theme ||= "impact_travel"
    end

    def site_logo
      @site_logo ||= ImpactTravel.configuration.logo
    end

    def site_contact
      @site_contact ||= "+1 888 123 4567"
    end

    def site_abbreviation
      @site_abbreviation ||= "CDN"
    end

    def font_awesome(icon_name)
      "<i class='fa #{icon_name}'></i>".html_safe
    end
  end
end
