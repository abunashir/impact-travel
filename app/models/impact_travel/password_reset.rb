module ImpactTravel
  class PasswordReset < ImpactTravel::Base
    attr_accessor :email

    def save
      @response = DiscountNetwork::Password.forgot(email)
    rescue RestClient::UnprocessableEntity
    end
  end
end
