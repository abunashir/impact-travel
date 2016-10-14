require "spec_helper"

feature "Supplementary subscriber" do
  scenario "subscriber adds supplementary" do
    stub_supplementary_list_api
    login_with_valid_credentials
    supplementary = build(:supplementary)
    stub_supplementary_create_api(supplementary.attributes)

    visit impact_travel.supplementaries_path
    click_on "Add new supplementary"

    fill_in "supplementary_email", with: supplementary.email
    fill_in "supplementary_phone", with: supplementary.phone
    fill_in "supplementary_first_name", with: supplementary.first_name
    fill_in "supplementary_last_name", with: supplementary.last_name
    click_on "Save supplementary"

    expect(page).to have_content(supplementary.last_name)
    expect(page).to have_content(I18n.t("supplementary.created"))
    expect(current_path).to eq(impact_travel.supplementaries_path)
  end
end
