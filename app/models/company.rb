class Company < ApplicationRecord
  has_many :broker_mcs, dependent: :destroy
  has_many :carrier_mcs, dependent: :destroy 
  before_create :build_carrier_mc
  before_create :build_broker_mc  
end

     