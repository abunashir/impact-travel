require "spec_helper"

describe ImpactTravel::PasswordReset do
  describe "#save" do
    it "saves the password resets through API" do
      password_reset = build(:password_reset)
      stub_password_forgot_api(password_reset.email)

      expect(password_reset.save).not_to be_nil
    end
  end

  describe "#valid_token?" do
    it "returns true for valid token" do
      password_reset = build(:password_reset, token: "ABCD_123")
      stub_password_validate_api(password_reset.token)

      expect(password_reset.valid_token?).to be_truthy
    end

    it "returns false for invalid token" do
      password_reset = build(:password_reset, token: "invalid")
      stub_unauthorized_dn_api_reqeust("account/resets/invalid")

      expect(password_reset.valid_token?).to be_falsey
    end
  end
end
