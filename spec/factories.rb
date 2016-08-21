FactoryGirl.define do
  factory :login, class: ImpactTravel::Login do
    name "username"
    password "secret_password"
  end

  factory :search, class: ImpactTravel::Search do
    location_id "835"
    destination "Bangkok, Thailand"
    check_in "25/08/2016"
    check_out "30/08/2016"
    guests "2"
  end
end
