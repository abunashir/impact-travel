module ImpactTravel
  class RefundsController < ImpactTravel::PoliciesController
    private

    def set_header_title
      @header_title = "Refund Policy"
    end
  end
end
