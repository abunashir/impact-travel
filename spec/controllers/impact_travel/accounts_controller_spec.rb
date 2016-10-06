require "spec_helper"

describe ImpactTravel::AccountsController do
  routes { ImpactTravel::Engine.routes }

  describe "#show" do
    context "valid auth_token exists" do
      it "renders the subscriber profile" do
        sign_in_as_subscriber
        stub_account_find_api(account_auth_token)
        get :show

        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end

    context "with invalid auth_token" do
      it "redirects user to the new session path" do
        sign_in_as_subscriber
        session[:auth_token] = "invalid_token"

        stub_unauthorized_dn_api_reqeust("account")
        get :show

        expect(session[:auth_token]).to be_nil
        expect(response).to redirect_to(new_session_path)
        expect(flash.notice).to eq(I18n.t("account.invalid"))
      end
    end
  end

  describe "#edit" do
    context "with valid auth_token" do
      it "renders the edit form" do
        sign_in_as_subscriber
        stub_valid_subscriber_account
        get :edit

        expect(assigns(:account)).not_to be_nil
        expect(response).to render_template(:edit)
      end
    end

    context "with invalid auth token" do
      it "redirects to the new session path" do
        sign_in_as_subscriber
        session[:auth_token] = "invalid_token"

        stub_unauthorized_dn_api_reqeust("account")
        get :edit

        expect(response).to redirect_to(new_session_path)
        expect(flash.notice).to eq(I18n.t("account.invalid"))
      end
    end
  end

  describe "#update" do
    context "with missing required fields" do
      it "re renders the subscriber edit screen" do
        sign_in_as_subscriber
        stub_valid_subscriber_account

        put :update, subscriber: attributes_for(:invalid_subscriber)

        expect(response).to render_template(:edit)
        expect(assigns(:subscriber)).not_to be_nil
      end
    end
  end

  def stub_valid_subscriber_account
    stub_account_find_api(account_auth_token)
  end
end
