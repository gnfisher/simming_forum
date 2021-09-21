require "securerandom"

class LoginToken < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  def self.active
    where("created_at > ?", Time.now - 10.minutes)
  end

  def generate_token
    self.token = SecureRandom.hex(32)
  end

  def to_param
    token
  end
end
