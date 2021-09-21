class User < ApplicationRecord
  has_many :login_tokens
end
