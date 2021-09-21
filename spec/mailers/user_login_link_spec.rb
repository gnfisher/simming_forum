require "rails_helper"

RSpec.describe UserLoginLinkMailer, type: :mailer do
  describe "#login_email" do
    it "includes a link to login the user" do
      user = create(:user)
      token = create(:login_token)

      message = UserLoginLinkMailer.login_email(user: user, login_token: token)

      expect(message).to have_text(user.email)
      expect(message).to have_link("Click here", href: session_url(token))
    end
  end
end
