module ImpactTravel
  class TermsController < ImpactTravel::PoliciesController
    private

    def set_header_title
      @header_title = "Terms Of Use"
    end
  end
end
