module ImpactTravel
  class CruisesController < ProvidersController
    private

    def provider_type
      @provider_type ||= "cruise"
    end

    def set_page_attributes
      @page_title = "Cruises"
      @page_subtitle = "This is the sub title for cruises"
    end
  end
end
