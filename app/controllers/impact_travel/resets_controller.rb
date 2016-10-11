module ImpactTravel
  class ResetsController < ApplicationController
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

    def new_password_reset
      @password_reset = ImpactTravel::PasswordReset.new(password_reset_params)
    end

    def password_reset_params
      params.require(:password_reset).permit(:email)
    end
  end
end
