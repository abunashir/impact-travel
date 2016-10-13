module ImpactTravel
  class Supplementary < ImpactTravel::Base
    def list
      @response = DiscountNetwork::Supplementary.list
    end

    def self.all
      new.list
    end
  end
end
