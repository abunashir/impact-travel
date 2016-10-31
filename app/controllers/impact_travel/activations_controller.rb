module ImpactTravel
  class ActivationsController < ImpactTravel::ApplicationController
    def show
      set_activation_session(activation_token)
      redirect_to(new_account_activation_path)
    end

    def new
      load_subscriber
    end

    def create
      activate_subscriber || render_with_error(
        :new, message: I18n.t("activation.invalid")
      )
    end

    private

    def activation_token
      @activation_token ||=
        params[:activation_token] || session[:activation_token]
    end

    def load_subscriber
      if valid_activation_token?
        @subscriber ||= ImpactTravel::Subscriber.new(
          subscriber_account.editable_attributes,
        )
      end
    end

    def new_subscriber
      @subscriber = ImpactTravel::Subscriber.new(
        subscriber_params.merge(token: session[:activation_token]),
      )
    end

    def activate_subscriber
      if new_subscriber.activate
        set_activation_session(nil)
        redirect_to(new_session_path, notice: I18n.t("account.activated"))
      end
    end

    def subscriber_account
      @subscriber_account ||= ImpactTravel::Account.find_by_token(
        activation_token,
      )
    end

    def valid_activation_token?
      activation_token && !subscriber_account.nil?
    end

    def set_activation_session(token)
      session[:activation_token] = token
    end

    def subscriber_params
      params.require(:subscriber).permit(
        :first_name, :middle_name, :last_name, :spouse_name, :sex, :email,
        :phone, :mobile, :office_phone, :address, :city, :state, :zip, :country,
        :username, :password, :password_confirmation
      )
    end
  end
end
