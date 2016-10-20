module ImpactTravel
  class ToursController < ProvidersController
    private

    def provider_type
      @provider_type ||= "tour"
    end

    def set_page_attributes
      @page_title = "Tours"
      @page_subtitle = "This is the sub title for the tours"
    end
  end
end
