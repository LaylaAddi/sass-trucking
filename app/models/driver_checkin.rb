class DriverCheckin < ApplicationRecord
  belongs_to :driver_user 
  
  geocoded_by :ip_address,
    :latitude => :latitude , :longitude => :longitude  
  after_validation :geocode   


  
  # def address  
  #   [ from_city, from_state, from_zip].join(', ') 
  # end
end
