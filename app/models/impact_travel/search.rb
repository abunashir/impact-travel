module ImpactTravel
  class Search < ImpactTravel::Base
    attr_accessor :location_id, :destination, :check_in, :check_out, :guests
    attr_accessor :search_id

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
    rescue RestClient::UnprocessableEntity
    end

    def search
      @search ||=
        if response
          response.search
        end
    end

    def self.find(search_id)
      DiscountNetwork::Search.find(search_id)
    end
  end
end
