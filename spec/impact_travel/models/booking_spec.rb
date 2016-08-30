require "spec_helper"

describe ImpactTravel::Booking do
  describe "#result" do
    it "retrieves the hotel from the specific search" do
      result = build(:result)
      stub_search_result_api(
        hotel_id: result.hotel_id, search_id: result.search_id
      )

      booking = ImpactTravel::Booking.new(
        hotel_id: result.hotel_id,
        search_id: result.search_id
      )

      expect(booking.result.id).to eq(result.hotel_id)
      expect(booking.result.search.id).to eq(result.search_id)
    end
  end

  describe "#create" do
    it "creates a new booking request" do
      booking = build(:booking)
      stub_search_booking_create_api(booking.attributes)
      booking.create
      booking = booking.booking

      expect(booking.code).not_to be_nil
      expect(booking.travellers.first).not_to be_nil
      expect(booking.travel_criteria.id).to eq(123_456_789)
    end
  end

  describe ".find" do
    it "retruns the provided booking" do
      booking_id = 123_456_789
      stub_booking_find_api(booking_id)
      booking = ImpactTravel::Booking.find(booking_id)

      expect(booking.id).to eq(booking_id)
      expect(booking.travellers.first).not_to be_nil
      expect(booking.properties.first).not_to be_nil
    end
  end
end
