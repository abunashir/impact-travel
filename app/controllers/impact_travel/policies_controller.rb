module ImpactTravel
  class PoliciesController < ImpactTravel::ApplicationController
    before_action :require_login
    before_action :set_header_title

    def index
    end

    def show
      render(:index)
    end

    private

    def set_header_title
      @header_title = "Terms & Policies"
    end
  end
end
