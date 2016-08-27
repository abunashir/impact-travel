module ImpactTravel
  class ResultsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def index
      @results = Result.where(search_id: params[:search_id])
    end
  end
end
