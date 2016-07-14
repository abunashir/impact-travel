FactoryGirl.define do
  factory :login, class: ImpactTravel::Login do
    name "username"
    password "secret_password"
  end
end
