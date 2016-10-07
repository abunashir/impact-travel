module ImpactTravel
  class Account < ImpactTravel::Base
    attr_accessor :token

    def find
      @response = DiscountNetwork::Account.find(token)
    rescue RestClient::Unauthorized
    end

    def find_by_token
      @response = DiscountNetwork::Activation.find(token)
    end

    def self.find(account_token = nil)
      new(token: account_token).find
    end

    def self.find_by_token(token)
      new(token: token).find_by_token
    end
  end
end
