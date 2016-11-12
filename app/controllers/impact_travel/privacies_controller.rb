module ImpactTravel
  class PrivaciesController < ImpactTravel::PoliciesController
    private

    def set_header_title
      @header_title = "Privacy Policy"
    end
  end
end
