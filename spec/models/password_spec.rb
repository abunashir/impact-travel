require "spec_helper"

describe ImpactTravel::Password do
  describe "#save" do
    it "saves the new password" do
      token = "ABCD_123"
      password = build(:password)
      stub_password_create_api(token, password.attributes)

      expect(password.save(token)).not_to be_nil
    end
  end

  describe "#update" do
    it "save the password changes" do
      set_account_auth_token
      password = build(:password)
      stub_account_update_api(account_auth_token, password.attributes)

      expect(password.update).not_to be_nil
    end
  end
end
