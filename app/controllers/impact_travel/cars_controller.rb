module ImpactTravel
  class CarsController < ProvidersController
    private

    def provider_type
      @provider_type ||= "car"
    end
  end
end
