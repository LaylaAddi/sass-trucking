class Company < ApplicationRecord
  belongs_to :company_manager
  has_one :broker_mc, dependent: :destroy
  has_one :carrier_mc, dependent: :destroy
  has_one :us_dot, dependent: :destroy  
  before_create :build_carrier_mc
  before_create :broker_mc
  before_create :us_dot
end

     