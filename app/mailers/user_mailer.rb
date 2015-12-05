class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "PUG: Activate your account!"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "PUG: Password reset"
  end
end
