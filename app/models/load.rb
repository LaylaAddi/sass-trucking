class Load < ApplicationRecord
  
  before_save :set_rate_to_driver
  before_update :set_rate_to_driver
  belongs_to :hrc_user 
  belongs_to :driver_user, optional: true  
  belongs_to :company_profile 
  has_many :load_addresses, dependent: :destroy  
  has_many :load_expenses, dependent: :destroy
  accepts_nested_attributes_for :load_expenses
  before_validation :delivery_date, date: { after_or_equal_to: Proc.new { :pick_up_date }, 
  message: "(error) Delivery can't be before pick up" }, on: :create
  validates_presence_of :driver_user_id
  validates_presence_of :company_profile 
  validates_presence_of :percent_deducted
  validates_numericality_of :percent_deducted

  def grpm
    self.rate / self.miles 
  end

  def ddbop #dollars deducted based on percent
   self.rate * self.percent_deducted
  end
  
  def rapd #rate after percent deducted
   self.rate - ddbop 
  end
  

  def set_rate_to_driver
    self.rate_to_driver = rapd
  end
  
  def load_title
    self.origin_city + ", " + self.origin_state + " TO: " + self.destination_city + ", " + self.destination_state   
  end

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
