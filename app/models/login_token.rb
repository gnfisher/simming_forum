require "securerandom"

class LoginToken < ApplicationRecord
  belongs_to :user

  before_create :generate_token_and_valid_until

  def self.active
    where("valid_until > ?", Time.current)
  end

  def generate_token_and_valid_until
    self.token = SecureRandom.hex(32)
    self.valid_until = valid_until || 10.minutes.from_now
  end

  def to_param
    token
  end
end
