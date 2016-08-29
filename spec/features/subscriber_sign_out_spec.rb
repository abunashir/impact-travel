require "spec_helper"

feature "Subscriber sign out" do
  scenario "using the logout link" do
    login_with_valid_credentials
    click_on "logout"

    expect(page).not_to have_content("Why Book with")
    expect(current_path).to eq(impact_travel.landing_path)
  end
end
