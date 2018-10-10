require "spec_helper"

describe ImpactTravel::SupplementariesController do
  routes { ImpactTravel::Engine.routes }

  describe "#create" do
    context "missing required data" do
      it "re renders the supplementary creation page" do
        sign_in_as_subscriber
        supplementary_attributes = attributes_for(
          :supplementary, first_name: nil, email: nil
        )

        post :create, params: { supplementary: supplementary_attributes }

        expect(response).to render_template(:new)
        expect(flash.now[:error]).to eq(I18n.t("supplementary.invalid"))
      end
    end
  end
end
