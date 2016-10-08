class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :company_profile_membership
  has_one :company_profile, through: :company_profile_membership
   
  def full_name
    self.first_name+" "+self.last_name
  end
  
  def profile_admin_user
    if self.company_profile_admin == "true"
      return "Company Admin"
    else
      return "" 
    end
  end
  
  def dispatcher_user
    if self.dispatcher == true 
      return "Dispatcher"
    else
      return "" 
    end
  end 
  
  def office_user
    if self.office == true
      return  "Office Staff"
    else
      return "" 
    end
  end    

  def maintenance_user
    if self.maintenance == true
      return  "Maintenance"
    else
      return "" 
    end
  end

  
  def shipping_user
    if self.shipping_receiving == true
      return  "Shipping Department"
    else
      return "" 
    end
  end 
  
 
  
  def user_position
    [shipping_user, maintenance_user, office_user, dispatcher_user,
    profile_admin_user].join(" ")
  end
  
  def type_of_user
    if self.type == "DriverUser"
      return "Driver"
    elsif self.type == "ShipperUser"
      return "Broker/Shipper"
    elsif self.type == "HrcUser"
      return "HRC User"  
    end
  end

end
   