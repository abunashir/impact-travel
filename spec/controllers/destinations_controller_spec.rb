require "spec_helper"

describe ImpactTravel::DestinationsController, type: :controller do
  routes { ImpactTravel::Engine.routes }

  describe "GET /destinations" do
    it "returns the destinations" do
      search_term = "bangkok"

      stub_destination_list_api(term: search_term)
      get :index, term: search_term
      response_body = JSON.parse(response.body)

      expect(response_body.first["value"]).to eq(835)
      expect(response_body.first["label"]).to eq("Bangkok, Thailand")
    end
  end
end
