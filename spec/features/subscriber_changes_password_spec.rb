require "spec_helper"

feature "Changing password" do
  scenario "subscriber changes their password" do
    login_with_valid_credentials
    auth_token = DiscountNetwork.configuration.auth_token
    password = build(:password)

    stub_account_find_api(auth_token)
    stub_account_update_api(auth_token, password.attributes)

    click_on "my_account"
    click_on "Change password"

    fill_in "New password", with: password.password
    fill_in "Re-type new password", with: password.password_confirmation
    click_on "Save changes"

    expect(page).to have_content(I18n.t("account.updated"))
    expect(current_path).to eq(impact_travel.account_path)
  end
end
