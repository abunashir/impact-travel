require "spec_helper"

describe ImpactTravel::PasswordReset do
  describe "#save" do
    it "saves the password resets through API" do
      password_reset = build(:password_reset)
      stub_password_forgot_api(password_reset.email)

      expect(password_reset.save).not_to be_nil
    end
  end
end
