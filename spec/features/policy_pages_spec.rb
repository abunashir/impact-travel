require "spec_helper"

feature "Polcy pages" do
  scenario "listing pages" do
    login_with_valid_credentials
    click_on "Policies"

    expect(page).to have_content("Terms & Policies")
  end

  scenario "terms of use page" do
    login_with_valid_credentials
    click_on "Terms of Use"

    expect(page).to have_content("Terms Of Use")
    expect(page).to have_content("Scope of our Service")
    expect(page).to have_content("Disclaimer of Warranties")
  end
end
