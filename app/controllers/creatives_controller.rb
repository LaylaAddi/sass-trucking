class CreativesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "creative"

  def index
  end
  

end
