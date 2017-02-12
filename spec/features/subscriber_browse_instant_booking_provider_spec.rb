require "spec_helper"

feature "Instant booking provider" do
  scenario "subscriber browse instant booking provider" do
    login_with_valid_credentials

    stub_provider_find_by_slug_api(instant_provider_slug)
    visit impact_travel.instant_provider_path

    expect(current_path).not_to eq(impact_travel.instant_provider_path)
  end

  def instant_provider_slug
    "instant"
  end
end
