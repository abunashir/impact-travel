require "spec_helper"

describe ImpactTravel::PasswordsController do
  routes { ImpactTravel::Engine.routes }

  describe "#update" do
    context "fields do not match the requirements" do
      it "re renders the password changing form" do
        sign_in_as_subscriber
        set_account_auth_configuration
        password = build(:password, password: "invalid")

        patch :update, password: password.attributes

        expect(assigns(:password)).not_to be_nil
        expect(response).to render_template(:edit)
      end
    end
  end

  def set_account_auth_configuration
    DiscountNetwork.configuration.auth_token = "ABCD_123"
  end
end
