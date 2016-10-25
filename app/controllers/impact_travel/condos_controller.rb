module ImpactTravel
  class CondosController < ProvidersController
    private

    def provider_type
      @provider_type ||= "resort"
    end
  end
end
