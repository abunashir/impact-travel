require "spec_helper"

describe ImpactTravel::Login do
  describe "#attributes" do
    it "returns the attributes as hash" do
      login = build(:login)
      attributes = login.attributes

      expect(attributes[:name]).to eq(login.name)
      expect(attributes[:password]).to eq(login.password)
    end
  end

  describe "#authenticate" do
    it "authenticates the user through the api" do
      login = build(:login)
      stub_session_create_api(login.attributes)

      expect(login.authenticate).to be_truthy
      expect(login.subscriber.username).to eq(login.name)
    end
  end
end
