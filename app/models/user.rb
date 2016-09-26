class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
       
  def full_name
    (self.first_name+" "+self.last_name)
  end
  
  def user_type
    if self.type == "OfficeUser" 
      return "Office"
    elsif self.type == "DriverUser"
      return "Driver"
    elsif self.type == "ShipmentUser"
      return "Shipper"
    end
  end
end
