require "spec_helper"

feature "Creating a new booking" do
  scenario "subscriber creates a new booking" do
    search_id = 123_456_789
    hotel_id = 352_96
    login_with_valid_credentials

    stub_search_results_api(search_id: search_id)
    stub_search_result_api(search_id: search_id, hotel_id: hotel_id)

    visit impact_travel.search_results_path(search_id)
    within("div.content-btn", match: :first) do
      click_on "View Details"
    end

    expect(page).to have_link("Request Now")
  end
end
