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

  describe "site configurations" do
    it "returns the site configurations" do
      site_title = "Impact Travel"
      site_abbreviation = "IT"
      site_logo = "logo.png"
      site_contact = "+1 123 456 789 1023"

      site_keywords = "travel, discount"
      site_description = "Travel the world in cheapest price"
      site_author = "Impact Services"
      site_stylesheet = "custom"

      ImpactTravel.configure do |config|
        config.logo = site_logo
        config.title = site_title
        config.abbreviation = site_abbreviation
        config.keywords = site_keywords
        config.description = site_description
        config.author = site_author
        config.phone = site_contact
        config.stylesheet = site_stylesheet
      end

      configuration = ImpactTravel.configuration

      expect(configuration.logo).to eq(site_logo)
      expect(configuration.title).to eq(site_title)
      expect(configuration.phone).to eq(site_contact)
      expect(configuration.author).to eq(site_author)
      expect(configuration.keywords).to eq(site_keywords)
      expect(configuration.stylesheet).to eq(site_stylesheet)
      expect(configuration.description).to eq(site_description)
      expect(configuration.abbreviation).to eq(site_abbreviation)
    end
  end

  describe "social links" do
    it "returns the social link configurations" do
      facebook = "https://facebook.com/example-page"
      twitter = "https://twitter.com/example-page"
      instagram = "https://instagram.com/example-page"

      ImpactTravel.configure do |config|
        config.facebook = facebook
        config.twitter = twitter
        config.instagram = instagram
      end

      expect(ImpactTravel.configuration.facebook).to eq(facebook)
      expect(ImpactTravel.configuration.twitter).to eq(twitter)
      expect(ImpactTravel.configuration.instagram).to eq(instagram)
    end
  end
end
