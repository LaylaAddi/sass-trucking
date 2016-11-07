class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :driver_list 
  around_filter :user_time_zone, if: :current_user
  
  
  def driver_list 
    @driver_list = DriverUser.where(["employment_status = ?", "active"])  
  end
  
  devise_group :user, contains: [:hrc_user, :shipper_user, :driver_user] 
  devise_group :hrc_user, contains: [:hrc_user] 
  before_action :authenticate_user!

  private
    def validate_hrc_user
      if !current_hrc_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end
    
    def user_time_zone(&block)
    	Time.use_zone(current_user.time_zone, &block)
    end
    
end
