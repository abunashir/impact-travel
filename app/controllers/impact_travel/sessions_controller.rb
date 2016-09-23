module ImpactTravel
  class SessionsController < ApplicationController
    layout "impact_travel/login"
    before_action :redirect_logged_in_subscriber, except: [:destroy]

    def create
      if authenticated?
        sign_in(@login.subscriber)
        redirect_to(home_path, notice: I18n.t("sessions.created"))
      end
    end

    def destroy
      destroy_user_sessions
      redirect_to(landing_path, notice: I18n.t("sessions.destroyed"))
    end

    private

    def login
      @login = Login.new(login_params)
    end

    def authenticated?
      login.authenticate
    end

    def destroy_user_sessions
      session[:auth_token] = nil
    end

    def login_params
      params.require(:login).permit(:name, :password)
    end
  end
end
