class Load < ApplicationRecord

  belongs_to :hrc_user 
  belongs_to :driver_user, optional: true  
  belongs_to :company_profile 
  validates_presence_of :driver_user_id
  has_many :load_addresses, dependent: :destroy 
  has_many :load_expenses, dependent: :destroy
  has_many :load_payment_categories
  has_one :driver_statement, through: :load_payment_categories

  validates_presence_of :company_profile 
  before_validation :delivery_date, date: { after_or_equal_to: Proc.new { :pick_up_date }, 
  message: "(error) Delivery can't be before pick up" }, on: :create

  def load_title
    self.origin_city + ", " + origin_state + " TO: " + destination_city + ", " + destination_state   
  end
  
  def grpm
    self.rate / self.miles 
  end

  def ddbop #dollars deducted based on percent
   self.rate * self.percent_deducted
  end
  
  def rapd #rate after percent deducted
   self.rate - ddbop 
  end
  
  def rpmapd #rate per mile after percent deducted
   rapd / self.miles
  end

end
