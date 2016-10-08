class Load < ApplicationRecord
  
  
  belongs_to :hrc_user 
  belongs_to :driver_user, optional: true  
  belongs_to :company_profile 
  validates_presence_of :driver_user_id
  has_many :load_addresses, dependent: :destroy 
  has_many :load_expenses, dependent: :destroy
  accepts_nested_attributes_for :load_expenses
  validates_presence_of :company_profile 
  validates :delivery_date,
  date: { after_or_equal_to: Proc.new { :pick_up_date }, message: "(error) Delivery can't be before pick up" },
  on: :create

end
