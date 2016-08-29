module ImpactTravel
  class ResultsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def index
      @results = Result.where(search_id: params[:search_id])
    end

    def show
      @result = Result.find_by(
        search_id: params[:search_id], hotel_id: params[:id]
      )
    end
  end
end
