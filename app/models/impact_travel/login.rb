module ImpactTravel
  class Login < ImpactTravel::Base
    attr_accessor :name, :password
    validates :name, :password, presence: true

    def attributes
      { name: name, password: password }
    end

    def authenticate
      if valid?
        @response = DiscountNetwork::Session.create(attributes)
      end
    rescue RestClient::Unauthorized
    end

    def subscriber
      if response
        response.user
      end
    end
  end
end
