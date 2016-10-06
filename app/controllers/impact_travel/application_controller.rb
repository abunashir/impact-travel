module ImpactTravel
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?

    def require_login
      unless logged_in?
        redirect_to(new_session_path)
      end
    end

    def sign_in(user)
      session[:auth_token] = user.token
    end

    def logged_in?
      user_auth_token.present?
    end

    private

    def user_auth_token
      @user_auth_token ||= session[:auth_token]
    end

    def set_auth_token
      DiscountNetwork.configuration.auth_token = user_auth_token
    end

    def render_with_error(view, message:)
      flash.now[:error] = message
      render view.to_sym
    end

    def redirect_logged_in_subscriber
      if logged_in?
        redirect_to(home_path)
      end
    end
  end
end
