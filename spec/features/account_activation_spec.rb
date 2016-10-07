require "spec_helper"

feature "Account activation" do
  scenario "subscriber activates account" do
    token = "TOKEN_123"

    stub_activation_find_api(token)
    stub_activation_activate_api(token, subscriber_attributes)
    visit impact_travel.account_activation_path(
      activation_token: token,
    )

    fill_in "subscriber_first_name", with: subscriber_attributes[:first_name]
    fill_in "subscriber_last_name", with: subscriber_attributes[:last_name]
    fill_in "subscriber_email", with: subscriber_attributes[:email]
    fill_in "subscriber_mobile", with: subscriber_attributes[:mobile]
    fill_in "subscriber_address", with: subscriber_attributes[:address]
    fill_in "subscriber_city", with: subscriber_attributes[:city]
    fill_in "subscriber_state", with: subscriber_attributes[:state]
    fill_in "subscriber_zip", with: subscriber_attributes[:zip]
    fill_in "subscriber_username", with: subscriber_attributes[:username]
    fill_in "subscriber_password", with: subscriber_attributes[:password]
    fill_in "Password confirmation", with: subscriber_attributes[:password]
    click_on "Activate Now"

    expect(page).to have_content(I18n.t("account.activated"))
    expect(current_path).to eq(impact_travel.new_session_path)
  end

  def subscriber_attributes
    @subscriber_attributes ||= {
      first_name: "John",
      middle_name: "",
      last_name: "Doe",
      spouse_name: "",
      sex: "male",
      email: "john.doe@example.com",
      phone: "123 456 7890",
      mobile: "+1 888 123 456 7890",
      office_phone: "",
      address: "House # 1, Main Street",
      city: "New York",
      state: "New York",
      zip: "123 ABC",
      country: "TH",
      username: "john.doe",
      password: "secret_password",
      password_confirmation: "secret_password",
    }
  end
end
