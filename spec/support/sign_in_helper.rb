module SignInHelpers
  def sign_in_as(subscriber)
    session[:auth_token] = subscriber.token
  end

  def sign_in_as_subscriber
    sign_in_as(build(:subscriber))
  end

  def account_auth_token
    @account_auth_token ||= "ABCD_123"
  end

  def set_account_auth_token
    @account_auth_token ||=
      DiscountNetwork.configuration.auth_token = account_auth_token
  end
end
