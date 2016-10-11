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
    expect(current_path).to eq(impact_travel.password_reset_path)
  end
end
