require "spec_helper"

feature "Car Providers" do
  scenario "subscriber browse car providers" do
    login_with_valid_credentials
    stub_provider_listing_api("car")
    stub_provider_find_by_slug_api(provider_slug)

    click_on "Cars"
    click_on "Browse now", match: :first

    expect(current_path).to eq(impact_travel.car_path(provider_slug))
  end
end
