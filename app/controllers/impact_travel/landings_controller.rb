module ImpactTravel
  class LandingsController < ImpactTravel::ApplicationController
    before_action :redirect_logged_in_subscriber

    def show
      render(layout: "impact_travel/landing")
    end
  end
end
