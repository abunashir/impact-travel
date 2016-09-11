require "spec_helper"

describe ImpactTravel::Account do
  describe ".find" do
    it "returns the account details" do
      account_token = "ABCD_123"
      stub_account_find_api(account_token)
      account = ImpactTravel::Account.find(account_token)

      expect(account.name).not_to be_nil
      expect(account.email).not_to be_nil
      expect(account.status).to eq("Active")
    end
  end
end
