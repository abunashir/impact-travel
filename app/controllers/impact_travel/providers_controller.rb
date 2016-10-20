module ImpactTravel
  class ProvidersController < ApplicationController
    before_action :require_login

    def index
      set_page_attributes
      load_hotel_providers
    end

    def show
      load_hotel_provider
      render(layout: "impact_travel/iframe")
    end

    private

    def load_hotel_provider
      @provider = ImpactTravel::Provider.find(params[:id])
    end

    def load_hotel_providers
      @providers = ImpactTravel::Provider.list_by_type(provider_type)
    end
  end
end
