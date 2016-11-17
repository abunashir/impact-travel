module ImpactTravel
  class Result < ImpactTravel::Base
    attr_accessor :search_id, :hotel_id

    def all(**attributes)
      DiscountNetwork::Result.where(
        attributes.merge(search_id: search_id).compact,
      )
    rescue RestClient::UnprocessableEntity
    end

    def find
      DiscountNetwork::Result.find_by(search_id: search_id, hotel_id: hotel_id)
    rescue RestClient::Unauthorized
    end

    def self.where(search_id:, **attributes)
      new(search_id: search_id).all(attributes)
    end

    def self.find_by(search_id:, hotel_id:)
      new(search_id: search_id, hotel_id: hotel_id).find
    end
  end
end
