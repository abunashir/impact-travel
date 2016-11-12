module ImpactTravel
  class CancellationsController < ImpactTravel::PoliciesController
    private

    def set_header_title
      @header_title = "Cancellation Policy"
    end
  end
end
