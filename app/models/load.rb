class Load < ApplicationRecord

  belongs_to :hrc_user 
  belongs_to :driver_user, optional: true   
  has_many :load_addresses, dependent: :destroy 
  has_many :load_bookings
  has_many :company_profiles, through: :load_bookings
end
