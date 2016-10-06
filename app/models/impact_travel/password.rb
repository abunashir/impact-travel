module ImpactTravel
  class Password < ImpactTravel::Base
    attr_accessor :password, :password_confirmation
    validates :password, presence: true, confirmation: true
    validates :password, length: { in: 6..20 }

    def attributes
      {
        password: password,
        password_confirmation: password_confirmation,
      }
    end

    def save
      if valid?
        @response = DiscountNetwork::Account.update(attributes)
      end
    end
  end
end
