require "spec_helper"

describe ImpactTravel::AccountsController do
  routes { ImpactTravel::Engine.routes }

  describe "#show" do
    context "valid auth_token exists" do
      it "renders the subscriber profile" do
        sign_in_as_subscriber
        stub_account_find_api(DiscountNetwork.configuration.auth_token)
        get :show

        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end

    context "with invalid auth_token" do
      it "redirects user to the new session path" do
        sign_in_as_subscriber
        session[:auth_token] = "invalid_token"

        stub_unauthorized_dn_api_reqeust("account")
        get :show

        expect(session[:auth_token]).to be_nil
        expect(response).to redirect_to(new_session_path)
        expect(flash.notice).to eq(I18n.t("account.invalid"))
      end
    end
  end
end
