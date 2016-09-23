module ImpactTravel
  class Login < ImpactTravel::Base
    attr_accessor :name, :password

    def attributes
      { name: name, password: password }
    end

    def authenticate
      @response = DiscountNetwork::Session.create(attributes)
    rescue RestClient::Unauthorized
    end

    def subscriber
      if response
        response.user
      end
    end
  end
end
