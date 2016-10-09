class CompanyProfile < ApplicationRecord
  has_one :broker_mc, dependent: :destroy
  has_one :carrier_mc, dependent: :destroy
  has_one :us_dot, dependent: :destroy  
  before_create :build_carrier_mc
  before_create :build_broker_mc
  before_create :build_us_dot
  has_many :loads
  has_many :company_profile_membership, dependent: :destroy
  has_many :users, through: :company_profile_membership
  has_many :vendor_profiles, dependent: :destroy 
  
  
  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end 
  end
  
end

      