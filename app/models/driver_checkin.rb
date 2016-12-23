class DriverCheckin < ApplicationRecord
  belongs_to :driver_user 
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
    
  
  def address 
    [from_city, from_state, from_zip].join(', ') 
  end
end
