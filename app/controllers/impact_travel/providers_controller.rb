module ImpactTravel
  class ProvidersController < ImpactTravel::ApplicationController
    before_action :require_login
    before_action :require_an_active_subscripton

    def index
      set_page_attributes
      load_hotel_providers
    end

    def show
      load_hotel_provider
      render(layout: "impact_travel/iframe")
    end

    private

    def set_page_attributes
      @page_title = load_from_translation("title")
      @page_subtitle = load_from_translation("subtitle")
    end

    def load_hotel_provider
      @provider = ImpactTravel::Provider.find(params[:id])
    end

    def load_hotel_providers
      @providers = ImpactTravel::Provider.list_by_type(provider_type)
    end

    def load_from_translation(key)
      I18n.t(["impact_travel", "providers", provider_type, key].join("."))
    end
  end
end
