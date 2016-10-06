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
end
