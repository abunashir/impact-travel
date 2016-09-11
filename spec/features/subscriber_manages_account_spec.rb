require "spec_helper"

feature "Subscriber profile" do
  scenario "browse their own profile" do
    login_with_valid_credentials
    stub_account_find_api(
      DiscountNetwork.configuration.auth_token,
    )

    click_on "my_account"

    expect(page).to have_content("subscription profile")
    expect(page).to have_content("Status Active")
    expect(page).to have_link("Edit profile")
  end
end
