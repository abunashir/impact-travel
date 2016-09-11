module ImpactTravel
  class AccountsController < ApplicationController
    before_action :require_login
    before_action :set_auth_token

    def show
      @account = ImpactTravel::Account.find
    end
  end
end
