module ImpactTravel
  class ResultsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def index
      load_results || redirect_to(
        home_path, notice: I18n.t("search.invalid")
      )
    end

    def show
      @result = Result.find_by(
        search_id: params[:search_id], hotel_id: params[:id]
      )
    end

    private

    def load_results
      @results = Result.where(search_id: params[:search_id])
    end
  end
end
