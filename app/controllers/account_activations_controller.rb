class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      # succesfully activate account
      user.activate
      login user
      redirect_to user
    else
      # Failed to activate account
      redirect_to root_url
    end
end
