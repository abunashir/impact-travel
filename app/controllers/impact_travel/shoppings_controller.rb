module ImpactTravel
  class ShoppingsController < ImpactTravel::ApplicationController
    before_action :require_login

    def show
      redirect_to("https://discountnetwork.enjoymydeals.com")
    end
  end
end
