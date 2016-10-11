module ImpactTravel
  class LandingsController < ApplicationController
    before_action :redirect_logged_in_subscriber

    def show
      render(layout: "landing")
    end
  end
end
