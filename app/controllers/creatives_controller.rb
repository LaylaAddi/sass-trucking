class CreativesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "creative"

  def index
    if current_hrc_user
      redirect_to hrc_dashboard_path
    elsif current_driver_user
      redirect_to driver_dashboard_path
    elsif current_shipper_user 
      redirect_to shipper_dashboard_path
    end
  end
  

end
