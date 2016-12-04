require "webmock/rspec"
ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb", __FILE__)
require "rspec/rails"
require "discountnetwork/rspec"
require "factory_girl"
require "shoulda-matchers"

Dir[ImpactTravel::Engine.root.join("spec/support/**/*.rb")].each do |file|
  require file
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.infer_spec_type_from_file_location!
  config.order = :random
  config.use_transactional_fixtures = true

  # Support Helpers
  config.include SignInHelpers
  config.include ProviderHelpers
  config.include Feature::AuthenticationHelpers
  config.include Shoulda::Matchers::ActiveModel
end

def restore_configuration_to_default
  ImpactTravel.configuration = nil
  ImpactTravel.configure {}
end
