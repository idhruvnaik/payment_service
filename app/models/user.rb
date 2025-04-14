class User < ApplicationRecord
  enum role: { user: 0, admin: 1, superadmin: 2 }

  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/i

  has_secure_token :auth_token
  has_secure_password

  has_many :payment_methods, dependent: :destroy

  validates :email, :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
