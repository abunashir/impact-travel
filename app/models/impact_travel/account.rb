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

    def subscriber
      @subscriber ||=
        if response
          response
        end
    end

    def editable_attributes
      subscriber.to_h.slice(
        :first_name, :middle_name, :last_name, :spouse_name, :sex,
        :email, :phone, :mobile, :office_phone, :address, :city, :state,
        :zip, :country, :username
      )
    end

    def self.find(token = nil)
      new(token: token).tap(&:find)
    end

    def self.find_by_token(token)
      new(token: token).tap(&:find_by_token)
    end
  end
end
