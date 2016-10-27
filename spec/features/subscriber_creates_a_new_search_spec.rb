require "spec_helper"

feature "New Search" do
  scenario "subscriber creates a new search" do
    login_with_valid_credentials
    search = build(:search)

    stub_search_create_api(search.attributes)
    stub_search_find_api(search.search_id)

    fill_in "search_destination", with: search.destination
    fill_in "search_check_in", with: search.check_in
    fill_in "search_check_out", with: search.check_out
    find("input#search_location_id", visible: false).set(
      search.location_id,
    )

    click_on "Search"

    expect(current_path).to eq(impact_travel.search_path(search.search_id))
    expect(page).to have_content("Looking for hotels in Bangkok, Thailand")
  end
end
