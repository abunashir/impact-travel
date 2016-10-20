require "spec_helper"

feature "Package Providers" do
  scenario "subscriber browse package providers" do
    login_with_valid_credentials

    stub_provider_listing_api("package")
    stub_provider_find_by_slug_api(provider_slug)

    click_on "PACKAGES"
    click_on "Browse now", match: :first

    expect(current_path).to eq(impact_travel.package_path(provider_slug))
  end
end
