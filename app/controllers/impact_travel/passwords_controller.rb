module ImpactTravel
  class PasswordsController < ApplicationController
    def edit
      @password = ImpactTravel::Password.new
    end

    def update
      update_password || render_with_error(
        :edit, message: I18n.t("account.update.error")
      )
    end

    private

    def update_password
      if new_password.save
        redirect_to(
          account_path, notice: I18n.t("account.updated")
        )
      end
    end

    def new_password
      @password ||= ImpactTravel::Password.new(password_params)
    end

    def password_params
      params.require(:password).permit(:password, :password_confirmation)
    end
  end
end
