require "spec_helper"

describe ImpactTravel::Configuration do
  after { restore_configuration_to_default }

  describe ".configuration" do
    it "returns the configuration object" do
      api_key = "discountnetwork_secret_key"
      ImpactTravel.configure { |config| config.api_key = api_key }

      expect(ImpactTravel.configuration.api_key).to eq(api_key)
    end
  end

  describe "#logo" do
    it "returns the configured logo name" do
      logo = "logo.png"
      ImpactTravel.configure { |config| config.logo = logo }

      expect(ImpactTravel.configuration.logo).to eq(logo)
    end
  end
end
