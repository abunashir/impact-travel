module ImpactTravel
  class CarsController < ProvidersController
    private

    def provider_type
      @provider_type ||= "car"
    end

    def set_page_attributes
      @page_title = "Cars"
      @page_subtitle = "This is the sub title for cars"
    end
  end
end
