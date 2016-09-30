require "spec_helper"

feature "Creating a new booking" do
  scenario "subscriber creates a new booking" do
    search_id = 123_456_789
    hotel_id = 456_789_012
    booking_id = 123_456_789
    subscriber = build(:subscriber)
    login_with_valid_credentials

    stub_booking_find_api(booking_id)
    stub_search_results_api(search_id: search_id)
    stub_search_result_api(search_id: search_id, hotel_id: hotel_id)
    stub_search_booking_create_api(
      booking_attributes(
        search_id: search_id, hotel_id: hotel_id, subscriber: subscriber,
      ),
    )

    visit impact_travel.search_results_path(search_id)
    within("div.content-btn", match: :first) do
      click_on "View Details"
    end

    click_on "Request Now"
    submit_the_booking_form(subscriber)

    expect(page).to have_content("john.doe@example.com")
    expect(page).to have_content("Booking confirmation")
    expect(current_path).to eq(impact_travel.booking_path(booking_id))
  end

  def submit_the_booking_form(subscriber)
    fill_in "booking_first_name", with: subscriber.first_name
    fill_in "booking_last_name", with: subscriber.last_name
    fill_in "booking_email", with: subscriber.email
    fill_in "booking_phone", with: subscriber.phone
    fill_in "booking_address", with: subscriber.address
    fill_in "booking_city", with: subscriber.city
    fill_in "booking_zip", with: subscriber.zip
    select "United States", from: "booking_country"
    fill_in "booking_special_request", with: "None"
    click_on "Submit request"
  end

  def booking_attributes(search_id:, hotel_id:, subscriber:)
    {
      note: "None",
      search_id: search_id.to_s,
      hotel_id: hotel_id.to_s,
      travellers: {
        first_name: subscriber.first_name,
        last_name: subscriber.last_name,
        phone: subscriber.phone,
        email: subscriber.email,
        address: subscriber.address,
        city: subscriber.city,
        zip: subscriber.zip,
        country: "US",
      },

      properties: {
        name: "Nasa Vegas Hotel",
        description: "",
        price: "14.3469",
        currency_code: "USD",
        review_score: "71",
        total_reviews: "14218",
      },
    }
  end
end
