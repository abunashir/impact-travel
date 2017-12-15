module ImpactTravel
  class ShoppingsController < ImpactTravel::ApplicationController
    before_action :require_login

    def show
      redirect_to(root_path)
    end
  end
end
