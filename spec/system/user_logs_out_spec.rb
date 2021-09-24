require "rails_helper"

RSpec.describe "user logs out", type: :system do
  it "a registered user logs out via email" do
    user = create(:user)

    visit root_path(as: user)
    click_link "Sign Out"

    expect(page).to have_content("Sign In")
  end
end
