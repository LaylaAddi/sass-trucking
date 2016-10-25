class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :driver_list 

  def driver_list 
    @driver_list = DriverUser.where(["employment_status = ?", "active"])  
  end
  
  devise_group :user, contains: [:hrc_user, :shipper_user, :driver_user] 
  devise_group :hrc_user, contains: [:hrc_user] 
  before_action :authenticate_user!

end
