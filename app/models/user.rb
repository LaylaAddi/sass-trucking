class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  ransack_alias :rs_user, :first_name_or_last_name_or_city_or_state       
  def full_name
    (self.first_name+" "+self.last_name)
  end
end
