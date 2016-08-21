require "spec_helper"

describe ImpactTravel::Search do
  describe ".create" do
    it "creates a new search with valid attributes" do
      search = build(:search)
      stub_search_create_api(search.attributes)

      expect(search.create.nil?).to eq(false)
      expect(search.response.search.wait_time).to be > 5
      expect(search.response.search.location).to eq(search.destination)
    end
  end
end
