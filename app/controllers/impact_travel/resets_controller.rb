module ImpactTravel
  class ResetsController < ApplicationController
    layout "impact_travel/login"

    def show
      validated_password_reset || redirect_to(
        new_session_path, notice: I18n.t("password_reset.invalid_token")
      )
    end

    def new
      @password_reset = ImpactTravel::PasswordReset.new
    end

    def create
      create_password_reset || redirect_to(
        new_session_path, notice: I18n.t("password_reset.invalid")
      )
    end

    private

    def create_password_reset
      if new_password_reset.save
        render :confirmation
      end
    end

    def validated_password_reset
      if valid_reset_token?
        session[:token] = reset_token
        redirect_to(new_password_path)
      end
    end

    def new_password_reset
      @password_reset = ImpactTravel::PasswordReset.new(password_reset_params)
    end

    def valid_reset_token?
      ImpactTravel::PasswordReset.new(token: reset_token).valid_token?
    end

    def reset_token
      @reset_token ||= params[:id]
    end

    def password_reset_params
      params.require(:password_reset).permit(:email)
    end
  end
end
