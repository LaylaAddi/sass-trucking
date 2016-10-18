class DriverStatement < ApplicationRecord

  has_many :load_payment_categories
  has_many :loads, through: :load_payment_categories
end
