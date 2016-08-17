require "spec_helper"

feature "Subscriber login" do
  scenario "subscriber has valid login credentials" do
    visit impact_travel.landing_path
    click_on "Subscriber login"
    subscriber = build(:login)

    stub_session_create_api(subscriber.attributes)

    fill_in "login_name", with: subscriber.name
    fill_in "login_password", with: subscriber.password
    click_on "Login"

    expect(page).to have_link("Hotels")
    expect(page).to have_selector("li.search-bar #my_account")
    expect(current_path).to eq(impact_travel.home_path)
  end
end
