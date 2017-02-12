module ImpactTravel
  class InstantsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      provider = Provider.find(instant_provider_slug)
      redirect_to(provider.link)
    end

    private

    def instant_provider_slug
      "instant"
    end
  end
end
