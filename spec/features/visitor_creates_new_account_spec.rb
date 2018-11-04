require "ostruct"
require "spec_helper"

feature "Account creation" do
  scenario "create new account with valid information" do
    subscriber = build_user
    set_allow_signup_configuration(true)
    stub_account_create_api(subscriber.to_h)

    visit impact_travel.new_account_path

    fill_in "subscriber_first_name", with: subscriber.first_name
    fill_in "subscriber_last_name", with: subscriber.last_name
    fill_in "subscriber_email", with: subscriber.email
    fill_in "subscriber_mobile", with: subscriber.mobile
    fill_in "subscriber_phone", with: subscriber.phone
    fill_in "subscriber_address", with: subscriber.address
    fill_in "subscriber_city", with: subscriber.city
    fill_in "subscriber_state", with: subscriber.state
    fill_in "subscriber_zip", with: subscriber.zip
    fill_in "subscriber_username", with: subscriber.username
    fill_in "subscriber_password", with: subscriber.password
    fill_in "Password confirmation", with: subscriber.password
    select "United States", from: "subscriber_country"

    click_on "Create Now"

    expect(current_path).to eq(impact_travel.new_session_path)
    expect(page).to have_content(I18n.t("account.create.success"))
  end

  scenario "does not create new account with invalid data" do
    set_allow_signup_configuration(true)
    visit impact_travel.new_account_path

    click_on "Create Now"

    expect(page).to have_content("Mobilecan't be blank")
    expect(page).to have_content("First namecan't be blank")
    expect(current_path).to eq(impact_travel.account_path)
  end

  scenario "user tries create account on non-supported site" do
    set_allow_signup_configuration(false)

    visit impact_travel.new_account_path

    expect(current_path).to eq(impact_travel.new_session_path)
  end

  def set_allow_signup_configuration(status = true)
    ImpactTravel.configuration.allow_signup = status
  end

  def build_user
    OpenStruct.new(
      first_name: "John",
      middle_name: "",
      last_name: "Doe",
      spouse_name: "",
      sex: "",
      email: "john.doe@example.com",
      phone: "123 456 7890",
      mobile: "+1 888 123 456 7890",
      office_phone: "",
      address: "Hose #1, Main Street",
      city: "New York",
      state: "New York",
      zip: "123 ABC",
      country: "US",
      username: "john.doe",
      password: "secret_password",
      password_confirmation: "secret_password",
    )
  end
end
