class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # successfully saved new user
      render 'new'
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end