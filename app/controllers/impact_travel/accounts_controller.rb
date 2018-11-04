module ImpactTravel
  class AccountsController < ImpactTravel::ApplicationController
    before_action :allow_signup, only: [:new, :create]
    before_action :require_login, except: [:new, :create]
    before_action :set_auth_token, except: [:new, :create]

    def new
      new_subscriber
    end

    def create
      create_account || render_with_error(
        :new, message: I18n.t("account.create.error")
      )
    end

    def show
      find_subscriber || redirect_to_sign_in_path
    end

    def edit
      build_account || redirect_to_sign_in_path
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

    def create_account
      if new_subscriber.register
        redirect_to_sign_in_path(I18n.t("account.create.success"))
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

    def redirect_to_sign_in_path(message = I18n.t("account.invalid"))
      destroy_user_sessions
      redirect_to(new_session_path, notice: message)
    end

    def destroy_user_sessions
      session[:auth_token] = nil
      DiscountNetwork.configuration.auth_token = nil
    end

    def account_params
      account_params = params[:subscriber]
      account_params ? account_params.permit(
        :first_name, :middle_name, :last_name, :spouse_name, :sex,
        :email, :phone, :mobile, :office_phone, :address, :city, :state,
        :zip, :country, :username, :password, :password_confirmation
      ) : {}
    end
  end
end
