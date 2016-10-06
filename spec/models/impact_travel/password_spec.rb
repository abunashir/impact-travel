require "spec_helper"

describe ImpactTravel::Password do
  describe "#save" do
    it "save the password changes" do
      set_account_auth_configuration
      password = build(:password)
      stub_account_update_api(
        DiscountNetwork.configuration.auth_token, password.attributes
      )

      expect(password.save).not_to be_nil
    end
  end

  def set_account_auth_configuration
    DiscountNetwork.configuration.auth_token = "ABCD_123"
  end
end
