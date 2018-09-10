module ImpactTravel
  class HomesController < ImpactTravel::ApplicationController
    before_action :require_login
    before_action :require_an_active_subscripton

    def show
      @search = Search.new
    end
  end
end
