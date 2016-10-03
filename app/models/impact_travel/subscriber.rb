module ImpactTravel
  class Subscriber < ImpactTravel::Base
    attr_accessor :first_name, :middle_name, :last_name, :spouse_name
    attr_accessor :sex, :email, :phone, :mobile, :office_phone, :address
    attr_accessor :city, :state, :zip, :country, :username, :password
    attr_accessor :password_confirmation, :status, :name, :token

    def save
      @response = DiscountNetwork::Account.update(attributes)
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
  end
end
