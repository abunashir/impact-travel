module ImpactTravel
  class Account < ImpactTravel::Base
    attr_accessor :token

    def find
      @response = DiscountNetwork::Account.find(token)
    end

    def self.find(account_token = nil)
      new(token: account_token).find
    end
  end
end
