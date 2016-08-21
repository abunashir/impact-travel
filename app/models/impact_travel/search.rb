module ImpactTravel
  class Search < ImpactTravel::Base
    attr_accessor :location_id, :destination, :check_in, :check_out, :guests

    def attributes
      {
        location_id: location_id,
        location_name: destination,
        check_in: check_in,
        check_out: check_out,
        adults: guests
      }
    end

    def create
      @response = DiscountNetwork::Search.create(attributes)
    end

    def search
      @search ||=
        if response
          response.search
        end
    end
  end
end
