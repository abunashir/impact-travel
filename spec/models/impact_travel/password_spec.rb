require "spec_helper"

describe ImpactTravel::Password do
  describe "#save" do
    it "save the password changes" do
      set_account_auth_token
      password = build(:password)
      stub_account_update_api(account_auth_token, password.attributes)

      expect(password.save).not_to be_nil
    end
  end
end
