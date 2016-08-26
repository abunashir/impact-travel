require "spec_helper"

feature "Subscriber sign out" do
  scenario "using the logout link" do
    login_as_valid_subscriber
    click_on "logout"

    expect(page).not_to have_content("Why Book with")
    expect(current_path).to eq(impact_travel.landing_path)
  end

  def login_as_valid_subscriber
    visit impact_travel.new_session_path
    subscriber = build(:login)
    stub_session_create_api(subscriber.attributes)

    fill_in "login_name", with: subscriber.name
    fill_in "login_password", with: subscriber.password
    click_on "Login"
  end
end
