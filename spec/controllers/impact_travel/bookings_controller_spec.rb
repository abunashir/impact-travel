require "spec_helper"

describe ImpactTravel::BookingsController do
  routes { ImpactTravel::Engine.routes }

  describe "#new" do
    context "with valid search result" do
      it "renders the booking form" do
        sign_in_as_subscriber
        stub_search_result_api(
          search_id: search_id, hotel_id: result_id,
        )

        get :new, search_id: search_id, result_id: result_id

        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end
    end

    context "with invalid search results" do
      it "redirects to the home path" do
        sign_in_as_subscriber
        result_id = "invalid_id"
        stub_unauthorized_dn_api_reqeust(
          ["searches", search_id, "results", result_id].join("/"),
        )

        get :new, search_id: search_id, result_id: result_id

        expect(response).to redirect_to(home_path)
        expect(flash.notice).to eq(I18n.t("search.invalid"))
      end
    end
  end

  describe "#create" do
    context "with valid booking information" do
      it "shows the booking confirmation" do
        sign_in_as_subscriber
        booking = build(:booking)
        stub_search_booking_create_api(
          booking_attributes(booking: booking),
        )

        post(
          :create,
          search_id: search_id,
          result_id: result_id,
          booking: attributes_for(:booking),
        )

        expect(response).to redirect_to(booking_path("123456789"))
        expect(flash.notice).to eq(I18n.t("booking.confirmation"))
      end
    end
  end

  def search_id
    @search_id ||= 123_456_789
  end

  def result_id
    @result_id ||= 456_789_012
  end

  def booking_attributes(booking:)
    {
      search_id: search_id.to_s,
      hotel_id: result_id.to_s,
      travellers: {
        first_name: booking.first_name,
        last_name: booking.last_name,
        phone: booking.phone,
        email: booking.email,
        address: booking.address,
        city: booking.city,
        zip: booking.zip,
        country: booking.country,
      },
      properties: {
        name: booking.hotel_name,
        description: booking.hotel_description,
        price: booking.promo_rate,
      },
    }
  end
end