module ImpactTravel
  class HotelsController < ApplicationController
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
      @providers = ImpactTravel::Provider.list_by_type("hotel")
    end

    def set_page_attributes
      @page_title = "Hotels"
      @page_subtitle = "This is going to be the subtile for the page"
    end
  end
end
