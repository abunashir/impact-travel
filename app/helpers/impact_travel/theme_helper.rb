module ImpactTravel
  module ThemeHelper
    def app_theme
      @app_theme ||= "impact_travel"
    end

    def site_logo
      @site_logo ||= ImpactTravel.configuration.logo
    end

    def site_title
      @site_title ||= ImpactTravel.configuration.title
    end

    def site_keywords
      @site_keywords ||= ImpactTravel.configuration.keywords
    end

    def site_description
      @site_description ||= ImpactTravel.configuration.description
    end

    def site_author
      @site_author ||= ImpactTravel.configuration.author
    end

    def site_contact
      @site_contact ||= ImpactTravel.configuration.phone
    end

    def site_abbreviation
      @site_abbreviation ||= ImpactTravel.configuration.abbreviation
    end

    def font_awesome(icon_name)
      "<i class='fa #{icon_name}'></i>".html_safe
    end
  end
end
