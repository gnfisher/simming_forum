class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: login_params[:email])

    if user.present?
      login_token = user.login_tokens.create!
      UserLoginLinkMailer.login_email(user: user, login_token: login_token).deliver_later
    end

    render "sessions/_success"
  end

  def show
    token = LoginToken.active.find_by(token: params[:token])

    if token.present?
      session[:user_id] = token.user_id
      redirect_to root_path, notice: "Successfully logged in."
    else
      redirect_to :new, flash[:notice] = "Please request a magic link to login."
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Successfully logged out."
  end

  private

  def login_params
    params.require(:session).permit(:email)
  end
end
