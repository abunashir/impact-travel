require "spec_helper"

feature "Page redirection" do
  scenario "logged in user try to access /landing" do
    login_with_valid_credentials
    visit impact_travel.landing_path

    expect(current_path).to eq("/home")
  end

  scenario "logged in user try to access /sessions/new" do
    login_with_valid_credentials
    visit impact_travel.new_session_path

    expect(current_path).to eq("/home")
  end
end
