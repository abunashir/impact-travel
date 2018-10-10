require "spec_helper"

describe ImpactTravel::ActivationsController do
  routes { ImpactTravel::Engine.routes }

  describe "#new" do
    context "with valid activation token" do
      it "renders the new activation page" do
        activation_token = "ABCD_123"
        session[:activation_token] = activation_token
        stub_activation_find_api(activation_token)

        get :new

        expect(response).to render_template(:new)
        expect(assigns[:subscriber]).not_to be_nil
      end
    end
  end

  describe "#create" do
    context "with invalid subscriber details" do
      it "re renders the activaton form" do
        token = "ABCD_123"
        session[:activation_token] = token

        post(
          :create,
          params: { subscriber: attributes_for(:invalid_subscriber) },
        )

        expect(response).to render_template(:new)
        expect(assigns[:subscriber]).not_to be_nil
        expect(flash[:error]).to eq(I18n.t("activation.invalid"))
      end
    end
  end
end
