class LoadDestinationAddress < Address
  belongs_to :load
  geocoded_by :destination_address
  after_validation :geocode  
  validates_presence_of :city, :state, :street 
  
  def destination_address
    [street, city, state, zip].join(', ')
  end
  
  def destination_city_state
    "Destination:  " + self.city + ", " + self.state 
  end 
end 
