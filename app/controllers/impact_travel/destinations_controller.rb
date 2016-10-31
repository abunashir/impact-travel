module ImpactTravel
  class DestinationsController < ImpactTravel::ApplicationController
    def index
      render json: similar_destinations
    end

    private

    def similar_destinations
      destinations.map do |destination|
        destination.to_h.slice(:label, :value)
      end
    end

    def destinations
      @destinations = DiscountNetwork::Destination.list(term: params[:term])
    end
  end
end
