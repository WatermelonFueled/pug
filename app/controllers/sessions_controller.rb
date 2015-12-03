class SessionsController < ApplicationController
  # login and logout

  # login page
  def new
  end

  # start new session (login)
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # successful login
      login user
      redirect_to user
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