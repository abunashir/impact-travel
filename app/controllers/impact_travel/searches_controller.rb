module ImpactTravel
  class SearchesController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      @search = Search.find(params[:id])
      render layout: "impact_travel/loading"
    end

    def create
      create_search || redirect_to(
        home_path, notice: I18n.t("search.create.errors")
      )
    end

    private

    def create_search
      if search.create
        redirect_to(
          impact_travel.search_path(@search.search.id),
          notice: I18n.t("search.create.success")
        )
      end
    end

    def search
      @search = ImpactTravel::Search.new(search_params)
    end

    def search_params
      params.require(:search).permit(
        :location_id, :destination, :check_in, :check_out, :guests
      )
    end
  end
end
