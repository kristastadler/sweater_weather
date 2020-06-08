class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :api_key, uniqueness: true, presence: true
  has_secure_password
  validates :password_digest, presence: true
end
