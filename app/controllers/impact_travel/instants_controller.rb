module ImpactTravel
  class InstantsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      @provider = Provider.find(instant_provider_slug)
      render "impact_travel/providers/show", layout: "impact_travel/iframe"
    end

    private

    def instant_provider_slug
      "instant"
    end
  end
end
