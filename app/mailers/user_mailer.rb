class UserMailer < ApplicationMailer

 # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account Activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
<<<<<<< HEAD
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
=======
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
>>>>>>> parent of 4f57694... Finished password resets
  end
end
