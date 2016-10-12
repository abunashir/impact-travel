module ImpactTravel
  class PasswordReset < ImpactTravel::Base
    attr_accessor :email, :token

    def save
      @response = DiscountNetwork::Password.forgot(email)
    rescue RestClient::UnprocessableEntity
    end

    def valid_token?
      if token
        @response = DiscountNetwork::Password.validate(token)
      end
    rescue RestClient::Unauthorized
    end
  end
end
