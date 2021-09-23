class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: login_params[:email])

    if user.present?
      login_token = user.login_tokens.create!
      UserLoginLinkMailer.login_email(user: user, login_token: login_token).deliver_later
    end

    redirect_to root_path, success: "Sent! Check your email for a magic link to log in."
  end

  def show
    token = LoginToken.active.find_by(token: params[:token])
    flash.keep
    if token.present?
      session[:user_id] = token.user_id
      redirect_to root_path, success: "Successfully logged in."
    else
      redirect_to sign_in_path, notice: "Please request a magic link to login."
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, success: "Successfully logged out."
  end

  private

  def login_params
    params.require(:session).permit(:email)
  end
end
