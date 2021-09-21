FactoryBot.define do
  factory :login_token do
    user
    token { nil }
  end

  factory :user do
    sequence :email do |n|
      "luke-#{n}@example.com"
    end
  end
end
