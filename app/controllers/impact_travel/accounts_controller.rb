module ImpactTravel
  class AccountsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      find_subscriber || redirect_to_sign_path
    end

    def edit
      build_account || redirect_to_sign_path
    end

    def update
      update_account || render_with_error(
        :edit, message: I18n.t("account.update.error")
      )
    end

    private

    def find_account
      @account ||= ImpactTravel::Account.find
    end

    def find_subscriber
      if find_account
        @subscriber = find_account.subscriber
      end
    end

    def build_account
      if find_account.subscriber
        @subscriber = ImpactTravel::Subscriber.new(
          find_account.editable_attributes,
        )
      end
    end

    def update_account
      if new_subscriber.save
        redirect_to(account_path, notice: I18n.t("account.updated"))
      end
    end

    def new_subscriber
      @subscriber = ImpactTravel::Subscriber.new(account_params)
    end

    def redirect_to_sign_path
      destroy_user_sessions
      redirect_to(new_session_path, notice: I18n.t("account.invalid"))
    end

    def destroy_user_sessions
      session[:auth_token] = nil
      DiscountNetwork.configuration.auth_token = nil
    end

    def account_params
      params.require(:subscriber).permit(
        :first_name, :middle_name, :last_name, :spouse_name, :sex,
        :email, :phone, :mobile, :office_phone, :address, :city, :state,
        :zip, :country, :username, :password, :password_confirmation
      )
    end
  end
end
