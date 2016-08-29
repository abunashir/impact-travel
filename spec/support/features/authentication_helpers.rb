module Feature
  module AuthenticationHelpers
    def login_with_valid_credentials
      visit impact_travel.new_session_path
      subscriber = build(:login, name: "username")
      stub_session_create_api(subscriber.attributes)

      fill_in "login_name", with: subscriber.name
      fill_in "login_password", with: subscriber.password
      click_on "Login"
    end
  end
end
