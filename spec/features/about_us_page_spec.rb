require "spec_helper"

feature "About Us" do
  scenario "subscriber browse about us page" do
    login_with_valid_credentials
    click_on "ABOUT"

    expect(page).to have_content("About Us")
    expect(page).to have_content("Sample Content")
  end
end
