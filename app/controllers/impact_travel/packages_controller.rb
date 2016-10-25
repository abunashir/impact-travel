module ImpactTravel
  class PackagesController < ProvidersController
    private

    def provider_type
      @provider_type ||= "package"
    end
  end
end
