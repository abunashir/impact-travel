module ImpactTravel
  class SupplementariesController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def index
      @supplementaries = ImpactTravel::Supplementary.all
    end
  end
end
