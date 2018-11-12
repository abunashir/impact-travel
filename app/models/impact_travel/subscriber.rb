module ImpactTravel
  class Subscriber < ImpactTravel::Base
    attr_accessor :first_name, :middle_name, :last_name, :spouse_name
    attr_accessor :sex, :email, :phone, :mobile, :office_phone, :address
    attr_accessor :city, :state, :zip, :country, :username, :password
    attr_accessor :password_confirmation, :status, :name, :token

    validates :first_name, :last_name, :email, :mobile, :address, presence: true
    validates :phone, :city, :state, :zip, :country, presence: true

    def save
      if valid?
        @response = DiscountNetwork::Account.update(attributes)
      end
    end

    def register
      if valid?
        @response = DiscountNetwork::Account.create(
          attributes.merge(package_id: default_package_id),
        )
      end
    end

    def activate
      if token && valid?
        @response = DiscountNetwork::Activation.activate(token, attributes)
      end
    end

    def attributes
      {
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        spouse_name: spouse_name,
        sex: sex,
        email: email,
        phone: phone,
        mobile: mobile,
        office_phone: office_phone,
        address: address,
        city: city,
        state: state,
        zip: zip,
        country: country,
        username: username,
        password: password,
        password_confirmation: password_confirmation,
      }.compact
    end

    private

    def default_package_id
      ImpactTravel.configuration.default_package_id
    end
  end
end
