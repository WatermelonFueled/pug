class SessionsController < ApplicationController
  # login and logout

  # login page
  def new
  end

  # start new session (login)
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        # successful login: user exists, correct password, is activated
        login user
        # is "remember me" check box checked?
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        # account not yet activated
        redirect_to root_url
      end
    else
      # unsuccessful login; back to login page
      render 'new'
    end
  end

  # end session (logout)
  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
