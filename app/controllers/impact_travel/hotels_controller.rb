module ImpactTravel
  class HotelsController < ProvidersController
    private

    def provider_type
      @provider_type ||= "hotel"
    end

    def set_page_attributes
      @page_title = "Hotels"
      @page_subtitle = "This is the sub title for the hotel"
    end
  end
end
