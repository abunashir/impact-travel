module ImpactTravel
  class ToursController < ProvidersController
    private

    def provider_type
      @provider_type ||= "tour"
    end
  end
end
