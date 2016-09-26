module ImpactTravel
  class Subscriber < ImpactTravel::Base
    attr_accessor :first_name, :last_name, :email, :phone
    attr_accessor :address, :city, :zip, :country, :token
  end
end
