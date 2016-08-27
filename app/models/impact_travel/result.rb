module ImpactTravel
  class Result < ImpactTravel::Base
    attr_accessor :search_id

    def all
      DiscountNetwork::Result.where(
        search_id: search_id
      )
    end

    def self.where(search_id:)
      new(search_id: search_id).all
    end
  end
end
