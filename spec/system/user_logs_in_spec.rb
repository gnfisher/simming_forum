require "rails_helper"

RSpec.describe "User logs in", type: :system do
  it "a registered user logs in via email" do
    user = create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "email", with: user.email
    click_button "Email Link"

    expect(page).to have_content("Sent!")

    expect {
      perform_enqueued_jobs
    }.to change { ActionMailer::Base.deliveries.count }.by 1

    login_token = LoginToken.where(user_id: user.id).first
    visit session_path(login_token)

    expect(page).to have_content("Sign Out")
  end
end
