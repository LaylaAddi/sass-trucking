class VendorProfile < ApplicationRecord
  has_many :load_expenses, dependent: :destroy 
end
