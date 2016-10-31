module ImpactTravel
  class PasswordsController < ImpactTravel::ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :set_auth_token, except: [:new, :create]
    layout "impact_travel/login", only: [:new, :create]

    def new
      validate_password_reset || redirect_to(
        new_session_path, notice: I18n.t("password_reset.invalid_token")
      )
    end

    def edit
      @password = ImpactTravel::Password.new
    end

    def create
      create_password || render_with_error(
        :new, message: I18n.t("password.invalid")
      )
    end

    def update
      update_password || render_with_error(
        :edit, message: I18n.t("account.update.error")
      )
    end

    private

    def create_password
      if reset_token && new_password.save(reset_token)
        set_app_session(:token, nil)
        redirect_to(new_session_path, notice: I18n.t("password.created"))
      end
    end

    def update_password
      if new_password.update
        redirect_to(
          account_path, notice: I18n.t("account.updated")
        )
      end
    end

    def validate_password_reset
      if reset_token
        @password = ImpactTravel::Password.new
      end
    end

    def new_password
      @password ||= ImpactTravel::Password.new(password_params)
    end

    def reset_token
      @reset_token ||= session[:token]
    end

    def password_params
      params.require(:password).permit(:password, :password_confirmation)
    end
  end
end
