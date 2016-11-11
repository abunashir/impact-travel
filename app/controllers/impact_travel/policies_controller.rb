module ImpactTravel
  class PoliciesController < ImpactTravel::ApplicationController
    before_action :require_login

    def index
      set_header_title
    end

    private

    def set_header_title
      @header_title = "Terms & Policies"
    end
  end
end
