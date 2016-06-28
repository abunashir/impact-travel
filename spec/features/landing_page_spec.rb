require "spec_helper"

feature "Landing page" do
  scenario "it shows the page override content" do
    visit impact_travel.landing_path

    expect(page).to have_content("Override this page in")
    expect(current_path).to eq("/landing")
  end
end
