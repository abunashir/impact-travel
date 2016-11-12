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

  scenario "price guarantee page" do
    login_with_valid_credentials

    click_on "Terms of Use"
    click_on "Best Price Guarantee"

    expect(page).to have_content("Submitting a Claim")
    expect(page).to have_content("Best Price Guarantee")
  end

  scenario "reservation guarantee page" do
    login_with_valid_credentials

    click_on "Terms of Use"
    click_on "Reservation Guarantee"

    expect(page).to have_content("Reservation Guarantee")
    expect(page).to have_content("Reservations secured via")
  end

  scenario "cancellation policy page" do
    login_with_valid_credentials

    click_on "Policies"
    click_on "Cancellation Policy"

    expect(page).to have_content("Cancellation Policy")
    expect(page).to have_content("Any cancellations received after")
  end

  scenario "privacy policy page" do
    login_with_valid_credentials

    click_on "Policies"
    click_on "Privacy Policy"

    expect(page).to have_content("Privacy Policy")
    expect(page).to have_content("Our Policy Concerning Cookies")
  end
end
