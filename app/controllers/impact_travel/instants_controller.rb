module ImpactTravel
  class InstantsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token
    before_action :require_an_active_subscripton

    def show
      # render "impact_travel/providers/show", layout: "impact_travel/iframe"
      provider = Provider.find(instant_provider_slug)
      redirect_to(provider.link)
    end

    private

    def instant_provider_slug
      "instant"
    end
  end
end
