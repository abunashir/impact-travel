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

    context "with specified sort order" do
      it "shows the sorted search results" do
        sign_in_as_subscriber
        search_params = {
          sort: "price",
          order: "desc",
          search_id: 123_456_789,
        }

        stub_search_results_api(search_params)
        get(:index, **search_params)

        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
      end
    end
  end

  describe "#show" do
    context "with valid result id" do
      it "renders the result page" do
        sign_in_as_subscriber
        result = build(:result)
        stub_search_result_api(
          search_id: result.search_id, hotel_id: result.hotel_id,
        )

        get(:show, id: result.hotel_id, search_id: result.search_id)

        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end

    context "with invalid result id" do
      it "reidrects to home page" do
        sign_in_as_subscriber
        result = build(:result, hotel_id: "invalid_hotel")
        stub_unauthorized_dn_api_reqeust(
          ["searches", result.search_id, "results", result.hotel_id].join("/"),
        )

        get(:show, id: result.hotel_id, search_id: result.search_id)

        expect(response).to redirect_to(home_path)
        expect(flash.notice).to eq(I18n.t("search.invalid"))
      end
    end
  end
end
