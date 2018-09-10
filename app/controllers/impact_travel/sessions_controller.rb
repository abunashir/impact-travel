module ImpactTravel
  class SessionsController < ImpactTravel::ApplicationController
    layout "impact_travel/login"
    before_action :redirect_logged_in_subscriber, except: [:destroy]

    def create
      create_session || redirect_to(
        new_session_path, notice: I18n.t("session.invalid")
      )
    end

    def destroy
      destroy_user_sessions
      redirect_to(landing_path, notice: I18n.t("session.destroyed"))
    end

    private

    def login
      @login = Login.new(login_params)
    end

    def create_session
      if login.authenticate
        sign_in(@login.subscriber)
        redirect_to(home_path, notice: I18n.t("session.created"))
      end
    end

    def destroy_user_sessions
      session[:auth_token] = nil
      session[:subscription_status] = nil
    end

    def login_params
      params.require(:login).permit(:name, :password)
    end
  end
end
