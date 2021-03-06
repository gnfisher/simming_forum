require "rails_helper"

RSpec.describe LoginToken, type: :model do
  it "generates a token on create" do
    login_token = build(:login_token)

    login_token.save
    login_token.reload

    expect(login_token.token).not_to be_nil
  end

  context ".active" do
    it "only returns login tokens created in the last 10 minutes" do
      _inactive = create(:login_token, valid_until: 1.minute.ago)
      active = create(:login_token, valid_until: 10.minutes.from_now)

      result = LoginToken.active

      expect(result).to contain_exactly(active)
    end
  end
end
