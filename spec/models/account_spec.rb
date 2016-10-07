require "spec_helper"

describe ImpactTravel::Account do
  describe ".find" do
    it "returns the account details" do
      account_token = "ABCD_123"
      stub_account_find_api(account_token)
      account = ImpactTravel::Account.find(account_token)

      expect(account.subscriber.name).not_to be_nil
      expect(account.subscriber.email).not_to be_nil
      expect(account.subscriber.status).to eq("Active")
    end
  end

  describe ".find_by_token" do
    it "finds account by activation token" do
      activation_token = "TOKEN_123"
      stub_activation_find_api(activation_token)
      account = ImpactTravel::Account.find_by_token(activation_token)

      expect(account.subscriber.name).not_to be_nil
      expect(account.subscriber.email).not_to be_nil
      expect(account.subscriber.status).to eq("Active")
    end
  end

  describe "#editable_attributes" do
    it "retruns the editable attributes" do
      account_token = "ABCD_123"
      stub_account_find_api(account_token)
      account = ImpactTravel::Account.find(account)

      expect(account.editable_attributes[:token]).to be_nil
      expect(account.editable_attributes[:first_name]).not_to be_nil
    end
  end
end
