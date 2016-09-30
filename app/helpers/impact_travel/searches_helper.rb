module ImpactTravel
  module SearchesHelper
    def guests_collection
      guests = (1..4).map { |num| ["#{num} Guests", num] }
      guests << ["5+ Guests", 5]
    end
  end
end
