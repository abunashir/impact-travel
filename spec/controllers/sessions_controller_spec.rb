require "spec_helper"

describe ImpactTravel::SessionsController do
  routes { ImpactTravel::Engine.routes }

  describe "#create" do
    context "subscriber provides valid credentials" do
      it "logged the subscriber in" do
        subscriber = build(:login)
        stub_session_create_api(subscriber.attributes)
        post :create, login: login_params(subscriber)

        expect(response).to redirect_to(home_path)
        expect(flash.notice).to eq(I18n.t("session.created"))
      end
    end

    context "subscriber provides invalid credentials" do
      it "re render the login page" do
        subscriber = build(:login, name: nil)
        post :create, login: login_params(subscriber)

        expect(response).to redirect_to(new_session_path)
        expect(flash.notice).to eq(I18n.t("session.invalid"))
      end
    end
  end

  def login_params(subscriber)
    { name: subscriber.name, password: subscriber.password }
  end
end
