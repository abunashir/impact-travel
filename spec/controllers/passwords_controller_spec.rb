require "spec_helper"

describe ImpactTravel::PasswordsController do
  routes { ImpactTravel::Engine.routes }

  describe "#new" do
    context "with invalid reset session" do
      it "redirecs to the new session path" do
        get :new

        expect(response).to redirect_to(new_session_path)
        expect(flash.notice).to eq(I18n.t("password_reset.invalid_token"))
      end
    end
  end

  describe "#create" do
    context "with invalid data" do
      it "re renders the new password form" do
        password = build(:password, password: "inv")
        post :create, params: { password: password.attributes }

        expect(response).to render_template(:new)
        expect(flash.now[:error]).to eq(I18n.t("password.invalid"))
      end
    end
  end

  describe "#update" do
    context "fields do not match the requirements" do
      it "re renders the password changing form" do
        sign_in_as_subscriber
        set_account_auth_token
        password = build(:password, password: "invalid")

        patch :update, params: { password: password.attributes }

        expect(assigns(:password)).not_to be_nil
        expect(response).to render_template(:edit)
      end
    end
  end
end
