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

  describe "#save" do
    context "with valid information" do
      it "saves the new supplementary" do
        supplementary = build(:supplementary)
        stub_supplementary_create_api(supplementary.attributes)

        expect(supplementary.save).not_to be_nil
      end

      it "returns nil if api response with error" do
        supplementary = build(:supplementary, email: "john.doe@example.com")
        stub_unprocessable_dn_api_request("supplementaries")

        expect(supplementary.save).to be_nil
      end
    end

    context "with invalid information" do
      it "returns nil with errors in it" do
        supplementary = build(
          :supplementary, first_name: nil, last_name: nil, email: nil
        )

        expect(supplementary.save).to be_nil
        expect(supplementary.errors.keys).to include(:email)
        expect(supplementary.errors.keys).to include(:first_name)
        expect(supplementary.errors.keys).to include(:last_name)
      end
    end
  end
end
