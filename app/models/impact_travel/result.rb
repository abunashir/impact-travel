module ImpactTravel
  class Result < ImpactTravel::Base
    attr_accessor :search_id, :hotel_id

    def all
      DiscountNetwork::Result.where(
        search_id: search_id
      )
    end

    def find
      DiscountNetwork::Result.find_by(
        search_id: search_id, hotel_id: hotel_id
      )
    end

    def self.where(search_id:)
      new(search_id: search_id).all
    end

    def self.find_by(search_id:, hotel_id:)
      new(search_id: search_id, hotel_id: hotel_id).find
    end
  end
end
