require "spec_helper"

feature "Tour Providers" do
  scenario "subscriber browse tour providers" do
    login_with_valid_credentials

    stub_provider_listing_api("tour")
    stub_provider_find_by_slug_api(provider_slug)

    click_on "Tours", match: :first
    click_on "Browse now", match: :first

    expect(current_path).to eq(impact_travel.tour_path(provider_slug))
  end
end
