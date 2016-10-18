class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:hrc_user, :shipper_user, :driver_user] 
  devise_group :hrc_user, contains: [:hrc_user] 
  before_action :authenticate_user!

  private
    def validate_hrc_user
      if !current_hrc_user flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
        redirect_to root_path
      else
      end
    end
end
