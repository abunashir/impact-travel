require "webmock/rspec"
ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb", __FILE__)
require "rspec/rails"
require "discountnetwork/rspec"
require "factory_girl"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.infer_spec_type_from_file_location!
  config.order = :random
  config.use_transactional_fixtures = true
end

def restore_configuration_to_default
  ImpactTravel.configuration = nil
  ImpactTravel.configure {}
end
