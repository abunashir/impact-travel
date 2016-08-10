module ImpactTravel
  class SessionsController < ApplicationController
    layout "impact_travel/login"

    def create
      if authenticated?
        sign_in(@login.subscriber)
        redirect_to(home_path, notice: I18n.t("sessions.created"))
      end
    end

    private

    def login
      @login = Login.new(login_params)
    end

    def authenticated?
      login.authenticate
    end

    def login_params
      params.require(:login).permit(:name, :password)
    end
  end
end
