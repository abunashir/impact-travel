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

  describe ".find_by" do
    it "finds the hotel from the specific search" do
      search = build_search_with_id
      hotel_id = 352_96
      stub_search_result_api(search_id: search.search_id, hotel_id: hotel_id)
      result = ImpactTravel::Result.find_by(
        search_id: search.search_id, hotel_id: hotel_id
      )

      expect(result.name).not_to be_nil
      expect(result.search.id).to eq(search.search_id)
    end
  end

  def build_search_with_id
    build(:search, search_id: 123_456_789)
  end
end
