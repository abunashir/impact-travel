require "spec_helper"

describe ImpactTravel::Supplementary do
  describe ".all" do
    it "retrieves all the supplementaries" do
      set_account_auth_token
      stub_supplementary_list_api
      supplementaries = ImpactTravel::Supplementary.all

      expect(supplementaries.count).not_to be_nil
      expect(supplementaries.first.name).not_to be_nil
    end
  end
end
