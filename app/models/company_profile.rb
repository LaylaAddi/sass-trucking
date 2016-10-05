class CompanyProfile < ApplicationRecord
  has_one :broker_mc, dependent: :destroy
  has_one :carrier_mc, dependent: :destroy
  has_one :us_dot, dependent: :destroy  
  before_create :build_carrier_mc
  before_create :build_broker_mc
  before_create :build_us_dot
  has_many :load_bookings
  has_many :loads, through: :load_bookings
end

     