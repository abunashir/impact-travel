require "spec_helper"

feature "Supplementary subscriber" do
  scenario "subscriber adds supplementary" do
    stub_supplementary_list_api
    login_with_valid_credentials
    visit impact_travel.supplementaries_path

    expect(page).to have_content("Mrs. Doe")
    expect(current_path).to eq(impact_travel.supplementaries_path)
  end
end
