module SignInHelpers
  def sign_in_as(subscriber)
    session[:auth_token] = subscriber.token
  end

  def sign_in_as_subscriber
    sign_in_as(build(:subscriber))
  end
end
