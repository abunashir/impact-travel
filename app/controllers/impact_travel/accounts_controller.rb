module ImpactTravel
  class AccountsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      load_account || redirect_to_sign_path
    end

    private

    def load_account
      @account = ImpactTravel::Account.find
    end

    def redirect_to_sign_path
      destroy_user_sessions
      redirect_to(new_session_path, notice: I18n.t("account.invalid"))
    end

    def destroy_user_sessions
      session[:auth_token] = nil
      DiscountNetwork.configuration.auth_token = nil
    end
  end
end
