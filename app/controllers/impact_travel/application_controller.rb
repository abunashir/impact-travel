module ImpactTravel
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def require_login
      unless logged_in?
        redirect_to(new_session_path)
      end
    end

    def sign_in(user)
      session[:auth_token] = user.token
    end

    private

    def logged_in?
      session[:auth_token].present?
    end
  end
end
