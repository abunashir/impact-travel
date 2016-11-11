module ImpactTravel
  class PriceGuaranteesController < ImpactTravel::PoliciesController
    private

    def set_header_title
      @header_title = "Best Price Guarantee"
    end
  end
end
