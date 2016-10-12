require "spec_helper"

describe ImpactTravel::ResetsController do
  routes { ImpactTravel::Engine.routes }

  describe "#create" do
    context "with invalid email address" do
      it "redirect the user to new session path" do
        invalid_email = "john.doe_example.com"
        stub_unprocessable_dn_api_request("account/resets")

        post :create, password_reset: { email: invalid_email }

        expect(response).to redirect_to(new_session_path)
        expect(flash.notice).to eq(I18n.t("password_reset.invalid"))
      end
    end
  end

  describe "#show" do
    it "redirects invalid reset request" do
      invalid_token = "invalid"
      stub_unauthorized_dn_api_reqeust("account/resets/invalid")

      get :show, id: invalid_token

      expect(response).to redirect_to(new_session_path)
      expect(flash.notice).to eq(I18n.t("password_reset.invalid_token"))
    end
  end
end
