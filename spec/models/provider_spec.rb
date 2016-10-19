require "spec_helper"

describe ImpactTravel::Provider do
  describe ".list_by_type" do
    it "retrieves the specified providers" do
      provider_type = "hotel"
      stub_provider_listing_api(provider_type)
      providers = ImpactTravel::Provider.list_by_type(provider_type)

      expect(providers.count).to eq(2)
      expect(providers.first.name).not_to be_nil
      expect(providers.first.images.thumb).not_to be_nil
    end
  end

  describe ".find" do
    it "retrieves provider by :slug" do
      provider_slug = "hotel-one"
      stub_provider_find_by_slug_api(provider_slug)
      provider = ImpactTravel::Provider.find(provider_slug)

      expect(provider.name).not_to be_nil
      expect(provider.slug).to eq(provider_slug)
    end
  end
end
