class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
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
  
  def driver_user
    if self.driver == true
      return  "Driver"
    else
      return ""       
    end
  end   
  
  def user_position
    [driver_user, shipping_user, maintenance_user, office_user, dispatcher_user,
    profile_admin_user].join(" ")
  end


end
   