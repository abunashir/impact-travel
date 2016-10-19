require "spec_helper"

feature "Hotel providers" do
  scenario "subscriber browse the hote providers" do
    login_with_valid_credentials
    stub_provider_listing_api("hotel")
    stub_provider_find_by_slug_api("hotel-one")

    click_on "Hotels"
    click_on "Browse now", match: :first

    expect(current_path).to eq(impact_travel.hotel_path("hotel-one"))
  end
end
