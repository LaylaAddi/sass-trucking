class CreativesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "creative"

  def index
    if current_user
      redirect_to dashboard_path
    end
  end
  

end
