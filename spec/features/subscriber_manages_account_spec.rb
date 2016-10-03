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

  scenario "edit their profile" do
    login_with_valid_credentials
    stub_account_find_api(DiscountNetwork.configuration.auth_token)
    stub_account_update_api(
      DiscountNetwork.configuration.auth_token, subscriber_attributes
    )

    click_on "my_account"
    click_on "Edit profile"

    fill_in "subscriber_first_name", with: subscriber_attributes[:first_name]
    fill_in "subscriber_last_name", with: subscriber_attributes[:last_name]
    fill_in "subscriber_username", with: subscriber_attributes[:username]
    fill_in "subscriber_email", with: subscriber_attributes[:email]
    click_on "Save changes"

    expect(current_path).to eq(impact_travel.account_path)
    expect(page).to have_content(I18n.t("account.updated"))
  end

  def subscriber_attributes
    @subscriber ||= {
      first_name: "John",
      middle_name: "",
      last_name: "Doe",
      spouse_name: "",
      sex: "male",
      email: "john.doe@example.com",
      phone: "123 456 7890",
      mobile: "123 456 7890",
      office_phone: "",
      address: "PG Rama 9 Condominium, Rama 9 Road",
      city: "Huai Khwang",
      state: "Bangkok",
      zip: "10310",
      country: "TH",
      username: "john.doe",
    }
  end
end
