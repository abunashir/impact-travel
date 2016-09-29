require "spec_helper"

describe ImpactTravel::BookingsController do
  routes { ImpactTravel::Engine.routes }

  describe "#new" do
    context "with valid search result" do
      it "renders the booking form" do
        sign_in_as_subscriber
        search_id = 123_456_789
        result_id = 456_789_012
        stub_search_result_api(
          search_id: search_id, hotel_id: result_id,
        )

        get :new, search_id: search_id, result_id: result_id

        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end
    end

    context "with invalid search results" do
      it "redirects to the home path" do
        sign_in_as_subscriber
        search_id = 123_456_789
        result_id = "invalid_id"
        stub_unauthorized_dn_api_reqeust(
          ["searches", search_id, "results", result_id].join("/"),
        )

        get :new, search_id: search_id, result_id: result_id

        expect(response).to redirect_to(home_path)
        expect(flash.notice).to eq(I18n.t("search.invalid"))
      end
    end
  end
end
