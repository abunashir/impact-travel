module ImpactTravel
  module ThemeHelper
    def app_theme
      @app_theme ||= "impact_travel"
    end

    def site_logo
      @site_logo ||= ImpactTravel.configuration.logo
    end

    def site_sticky_logo
      @site_sticky_logo ||= ImpactTravel.configuration.logo_inverse || site_logo
    end

    def site_title
      @site_title ||= ImpactTravel.configuration.title
    end

    def site_domain
      @site_domain ||= ImpactTravel.configuration.domain
    end

    def site_url
      @site_url ||= ["www", site_domain].join(".")
    end

    def site_secure_url
      @site_secure_url ||= ["https", site_url].join("://")
    end

    def site_info_email
      @site_info_email ||= ["info", site_domain].join("@")
    end

    def site_stylesheet
      @site_stylesheet ||= ImpactTravel.configuration.stylesheet
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

    def support_email
      @support_email ||= "travel@conciergeservices.io"
    end

    def site_abbreviation
      @site_abbreviation ||= ImpactTravel.configuration.abbreviation
    end

    def site_country
      @site_country ||= ImpactTravel.configuration.country
    end

    def site_address
      @site_address ||= ImpactTravel.configuration.address
    end

    def home_slides
      @home_slides ||= ImpactTravel.configuration.slides
    end

    def social_links
      @social_links ||= OpenStruct.new(
        facebook: ImpactTravel.configuration.facebook,
        twitter: ImpactTravel.configuration.twitter,
        instagram: ImpactTravel.configuration.instagram,
      )
    end

    def font_awesome(icon_name)
      "<i class='fa #{icon_name}'></i>".html_safe
    end

    def impact_t(*args)
      I18n.t(args.unshift("impact_travel").join("."))
    end

    def testimonial_t(number, key)
      impact_t("home", "testimonials", number, key)
    end
  end
end
