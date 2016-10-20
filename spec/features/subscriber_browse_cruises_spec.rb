require "spec_helper"

feature "Cruise Providers" do
  scenario "subscriber browse cruise providers" do
    login_with_valid_credentials

    stub_provider_listing_api("cruise")
    stub_provider_find_by_slug_api(provider_slug)

    click_on "Cruises"
    click_on "Browse now", match: :first

    expect(current_path).to eq(impact_travel.cruise_path(provider_slug))
  end
end
