require "spec_helper"

describe ImpactTravel::ResultsController do
  routes { ImpactTravel::Engine.routes }

  describe "#index" do
    context "with valid search id" do
      it "shows the search results" do
        sign_in_as_subscriber
        search_id = 123_456_789

        stub_search_results_api(search_id: search_id)
        get :index, search_id: search_id

        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
      end
    end

    context "with invalid search id" do
      it "redirects back to the home page" do
        sign_in_as_subscriber
        search_id = "invalid_id"
        stub_unprocessable_dn_api_request(
          ["searches", search_id, "results"].join("/"),
        )

        get :index, search_id: search_id

        expect(response).to redirect_to(home_path)
        expect(flash.notice).to eq(I18n.t("search.invalid"))
      end
    end
  end
end
