class CreativesController < ApplicationController
  layout "creative"

  def index
    if current_user
      redirect_to pages_index_path
    end
  end
  

end
