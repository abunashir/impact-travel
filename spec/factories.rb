FactoryGirl.define do
  factory :login, class: ImpactTravel::Login do
    name "username"
    password "secret_password"
  end

  factory :subscriber, class: ImpactTravel::Subscriber do
    first_name "John"
    last_name "Doe"
    email "john.doe@example.com"
    phone "+1 888 123 456 7890"
    address "House # 1, Main Street"
    city "New York"
    zip "123 ABC"
    state "New York"
    token "ABCD_123"
    mobile "+1 888 123 456 7890"
    country "US"

    factory :invalid_subscriber do
      first_name nil
      last_name nil
      email nil
      mobile nil
      address nil
      city nil
      state nil
      coutry nil
      username nil
    end
  end

  factory :search, class: ImpactTravel::Search do
    search_id 112_99
    location_id "835"
    destination "Bangkok, Thailand"
    check_in "25/08/2016"
    check_out "30/08/2016"
    guests "2"
  end

  factory :result, class: ImpactTravel::Result do
    search_id 123_456_789
    hotel_id 456_789_012
  end

  factory :booking, class: ImpactTravel::Booking do
    search_id 123_456_789
    hotel_id 456_789_012

    first_name "John"
    last_name "Doe"
    phone "123 456 7890"
    email "john.doe@example.com"
    address "123 Main Street"
    city "New York"
    zip "NY101"
    country "US"

    hotel_name "Nasa Vegas, Thailand"
    hotel_description "This is the description"
    promo_rate "100"
  end

  factory :password, class: ImpactTravel::Password do
    password "secret_password"
    password_confirmation "secret_password"
  end
end
