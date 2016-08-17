module ImpactTravel
  class Search < ImpactTravel::Base
    attr_accessor :location_id, :destination, :check_in, :check_out, :guests
  end
end
