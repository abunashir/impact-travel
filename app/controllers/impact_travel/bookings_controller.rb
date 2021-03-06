module ImpactTravel
  class BookingsController < ImpactTravel::ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      load_booking || redirect_to(
        home_path, notice: I18n.t("booking.invalid")
      )
    end

    def new
      valid_result? || redirect_to(
        home_path, notice: I18n.t("search.invalid")
      )
    end

    def create
      create_booking || render_with_error(
        :new, message: I18n.t("booking.create.errors")
      )
    end

    private

    def load_booking
      @booking = ImpactTravel::Booking.find(params[:id])
    end

    def valid_result?
      @result ||= build_booking.result
    end

    def build_booking
      @booking ||= ImpactTravel::Booking.new(
        search_id: params[:search_id],
        hotel_id: params[:result_id],
      )
    end

    def create_booking
      if booking.create
        redirect_to(
          booking_path(booking.booking.id),
          notice: I18n.t("booking.confirmation"),
        )
      end
    end

    def booking
      @booking ||= ImpactTravel::Booking.new(
        booking_params.merge(
          search_id: params[:search_id],
          hotel_id: params[:result_id],
        ),
      )
    end

    def booking_params
      params.require(:booking).permit(
        :hotel_id, :hotel_name, :hotel_price, :promo_rate,
        :hotel_score, :hotel_total_reviews, :hotel_description,
        :hotel_currency, :first_name, :last_name, :email, :phone,
        :address, :city, :zip, :country, :special_request
      )
    end
  end
end
