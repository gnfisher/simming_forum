class UserLoginLinkMailer < ApplicationMailer
  default from: "login@swsfonline.com"

  def login_email(user:, login_token:)
    @user = user
    @login_token = login_token

    mail(
      to: user.email,
      subject: "SWSF Online login email"
    )
  end
end
