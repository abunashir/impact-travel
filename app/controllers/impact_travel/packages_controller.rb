module ImpactTravel
  class PackagesController < ProvidersController
    private

    def provider_type
      @provider_type ||= "package"
    end

    def set_page_attributes
      @page_title = "Packages"
      @page_subtitle = "This is the sub title for packages"
    end
  end
end
