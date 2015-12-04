module SessionsHelper
  # creates new session for user logging in
  def login(user)
    session[:user_id] = user.id
  end

  # remember user in an unended session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # is user the current user
  def current_user?(user)
    user == current_user
  end

  # return current logged in user if any
  def current_user
    if (user_id = session[:user_id])
      # current session, return user
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      # cookie found of a persistent session
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        # user matching cookie has correct remember digest on account
        login user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # 'friendly forwarding' - to a stored location or to default
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # stores the url trying to be accessed
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
