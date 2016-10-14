module ImpactTravel
  class Supplementary < ImpactTravel::Base
    attr_accessor :email, :first_name, :last_name, :phone
    validates :email, :first_name, :last_name, :phone, presence: true

    def list
      @response = DiscountNetwork::Supplementary.list
    end

    def save
      if valid?
        @response = DiscountNetwork::Supplementary.create(attributes)
      end
    rescue RestClient::UnprocessableEntity
    end

    def self.all
      new.list
    end

    def attributes
      {
        email: email,
        phone: phone,
        first_name: first_name,
        last_name: last_name,
      }.compact
    end
  end
end
