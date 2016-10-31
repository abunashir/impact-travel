module ImpactTravel
  class AboutsController < ImpactTravel::ApplicationController
    before_action :require_login
  end
end
