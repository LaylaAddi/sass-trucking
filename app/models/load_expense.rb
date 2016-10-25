class LoadExpense < ApplicationRecord
  belongs_to :load
  belongs_to :vendor_profile

  validates_presence_of :expense_type, :amount
  validates_associated :vendor_profile
end