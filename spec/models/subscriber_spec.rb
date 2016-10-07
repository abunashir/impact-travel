require "spec_helper"

describe ImpactTravel::Subscriber do
  describe "#save" do
    context "passed required validations" do
      it "save the subscriber changes" do
        auth_token = "ABCD_123"
        subscriber = build(:subscriber, first_name: "John")
        DiscountNetwork.configuration.auth_token = auth_token
        stub_account_update_api(auth_token, subscriber.attributes)

        expect(subscriber.save).not_to be_nil
      end
    end
  end

  describe "#activate" do
    context "with valid subscriber information" do
      it "activates the subscriber's account" do
        subscriber = build(:subscriber, token: "ABCD_123")
        stub_activation_activate_api(
          subscriber.token, subscriber.attributes
        )

        expect(subscriber.activate).not_to be_nil
      end
    end
  end
end
