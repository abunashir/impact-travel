require "spec_helper"

feature "Polcy pages" do
  scenario "listing pages" do
    login_with_valid_credentials
    click_on "Policies"
  end
end
