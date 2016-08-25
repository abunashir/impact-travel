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

  describe ".find" do
    it "retrieves the search" do
      search_id = "DN_SEARCH_101"
      stub_search_find_api(search_id)
      search = ImpactTravel::Search.find(search_id)

      expect(search.id).to eq(search_id)
      expect(search.location).to eq("Bangkok, Thailand")
    end
  end
end
