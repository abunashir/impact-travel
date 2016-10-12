require "spec_helper"

feature "Password reset" do
  scenario "subscriber resets their password" do
    email = "john.doe@example.com"

    visit impact_travel.new_session_path
    click_on "Forgot your password?"
    stub_password_forgot_api(email)

    fill_in "password_reset_email", with: email
    click_on "Reset now"

    expect(page).to have_content("We have received your request")
    expect(current_path).to eq(impact_travel.password_resets_path)
  end

  scenario "subscriber sets new password" do
    token = "ABCD_123"
    stub_password_validate_api(token)
    stub_password_create_api(token, password_attrs)
    visit impact_travel.password_reset_path(token)

    fill_in "password_password", with: password_attrs[:password]
    fill_in "password_password_confirmation", with: password_attrs[:password]
    click_on "Save changes"

    expect(page).to have_content(I18n.t("password.created"))
    expect(current_path).to eq(impact_travel.new_session_path)
  end

  def password_attrs
    {
      password: "new_secret_password",
      password_confirmation: "new_secret_password",
    }
  end
end
