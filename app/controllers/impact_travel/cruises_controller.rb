module ImpactTravel
  class CruisesController < ProvidersController
    private

    def provider_type
      @provider_type ||= "cruise"
    end
  end
end
