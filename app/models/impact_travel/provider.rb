module ImpactTravel
  class Provider < ImpactTravel::Base
    attr_accessor :provider_type, :slug

    def find
      @response = DiscountNetwork::Provider.find_by_slug(slug)
    end

    def find_all
      @response = DiscountNetwork::Provider.where(type: provider_type)
    end

    def self.find(slug)
      new(slug: slug).find
    end

    def self.list_by_type(vendor_type)
      new(provider_type: vendor_type).find_all
    end
  end
end
