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
  end
end
