module ImpactTravel
  class ReservationGuaranteesController < ImpactTravel::PoliciesController
    private

    def set_header_title
      @header_title = "Reservation Guarantee"
    end
  end
end
