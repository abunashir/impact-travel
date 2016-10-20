module ImpactTravel
  class CondosController < ProvidersController
    private

    def provider_type
      @provider_type ||= "resort"
    end

    def set_page_attributes
      @page_title = "Condos"
      @page_subtitle = "This is the subtitle for condos page"
    end
  end
end
