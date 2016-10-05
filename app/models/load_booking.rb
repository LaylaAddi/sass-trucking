class LoadBooking < ApplicationRecord
  belongs_to :loads
  belongs_to :company_profile 
end