class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method
end
