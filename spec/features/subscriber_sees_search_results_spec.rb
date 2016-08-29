require "spec_helper"

feature "Search results" do
  scenario "subscribers sees search results" do
    search_id = 123_456_789
    login_with_valid_credentials
    stub_search_results_api(search_id: search_id)
    visit impact_travel.search_results_path(search_id)

    expect(page).to have_content("Nasa Vegas Hotel")
    expect(page).to have_content("Refine your results")
  end
end
