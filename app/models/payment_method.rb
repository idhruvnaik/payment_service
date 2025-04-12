class PaymentMethod < ApplicationRecord
  belongs_to :user

  enum method_type: { card: "card", upi: "upi", wallet: "wallet" }

  validates :method_type, presence: true
  validates :details, presence: true
end
