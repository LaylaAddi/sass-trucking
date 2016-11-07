class Load < ApplicationRecord
  
  before_save :set_rate, :set_rate_to_driver
  before_update :set_rate, :set_rate_to_driver 
  belongs_to :hrc_user 
  belongs_to :driver_user, optional: true  
  belongs_to :company_profile 
  has_many :load_addresses, dependent: :destroy  
  has_many :transactions, as: :transactionable
  accepts_nested_attributes_for :transactions 
  belongs_to :driver_statement, optional: true 
  
  has_many :load_documents, dependent: :destroy  

  
  before_validation :delivery_date, date: { after_or_equal_to: Proc.new { :pick_up_date }, 
  message: "(error) Delivery can't be before pick up" }, on: :create
  
  validates_presence_of :origin_street,:origin_city, :origin_state, :destination_street, 
  :destination_city, :destination_state, :load_size, :percent_deducted, :miles, 
  :equipment_type, :status_name, :driver_user_id, :company_profile, :percent_deducted,
  :booking_fee, :invoice_price, :consignor_name, :consignee_name
  
  validates_numericality_of :percent_deducted
  
  ransack_alias :load_search_params,
  :driver_user_first_name_or_driver_user_last_name_or_origin_city_or_destination_city_or_origin_state_or_destination_state_or_company_profile_company_name

 def set_rate
   self.rate = self.invoice_price - self.booking_fee
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
  
	def self.import(file)	
  	CSV.foreach(file.path, headers: true) do |row|
    	Load.create! row.to_hash     
  	end
  end  

end

                                    


                                 
