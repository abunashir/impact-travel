module ImpactTravel
  class Booking < ImpactTravel::Base
    attr_accessor :id, :search_id, :hotel_id
    attr_accessor :first_name, :last_name, :email, :phone, :address, :city, :zip
    attr_accessor :country, :special_request
    attr_accessor :hotel_name, :hotel_price, :promo_rate, :hotel_score
    attr_accessor :hotel_total_reviews, :hotel_description, :hotel_currency

    def attributes
      {
        search_id: search_id,
        hotel_id: hotel_id,
        note: special_request,
        travellers: traveller_attributes,
        properties: property_attributes
      }.compact
    end

    def result
      @result ||= Result.find_by(search_id: search_id, hotel_id: hotel_id)
    end

    def find
      @response = DiscountNetwork::Booking.find(id)
    end

    def create
      @response = DiscountNetwork::Booking.create(attributes)
    end

    def booking
      response
    end

    def self.find(booking_id)
      new(id: booking_id).find
    end

    private

    def traveller_attributes
      {
        first_name: first_name,
        last_name: last_name,
        phone: phone,
        email: email,
        address: address,
        city: city,
        zip: zip,
        country: country
      }.compact
    end

    def property_attributes
      {
        name: hotel_name,
        description: hotel_description,
        price: promo_rate,
        currency_code: hotel_currency,
        review_score: hotel_score,
        total_reviews: hotel_total_reviews
      }.compact
    end
  end
end
