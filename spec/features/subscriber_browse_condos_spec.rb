require "spec_helper"

feature "Condos Provider" do
  scenario "subscriber browse condo providers" do
    login_with_valid_credentials

    stub_provider_listing_api("resort")
    stub_provider_find_by_slug_api(provider_slug)

    click_on "RESOURCES"
    click_on "Condos", match: :first

    click_on "Browse now", match: :first

    expect(current_path).to eq(impact_travel.condo_path(provider_slug))
  end
end
