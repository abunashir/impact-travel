module ImpactTravel
  class HotelsController < ProvidersController
    private

    def provider_type
      @provider_type ||= "hotel"
    end
  end
end
