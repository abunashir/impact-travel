require "spec_helper"

describe ImpactTravel::Result do
  describe ".where" do
    it "retrieves all the search results" do
      search = build_search_with_id
      stub_search_results_api(search_id: search.search_id)
      results = ImpactTravel::Result.where(search_id: search.search_id)

      expect(results.current_page).to eq(1)
      expect(results.search.id).not_to be_nil
      expect(results.hotels.first.name).not_to be_nil
    end
  end

  def build_search_with_id
    build(:search, search_id: 123_456_789)
  end
end
