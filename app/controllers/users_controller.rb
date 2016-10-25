class UsersController < ApplicationController
  

  def index
  	@search = Load.search(params[:q])
  	@loads = @search.result.order(:id).page(params[:page]).per(1000) 
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.as_csv } 
    end
  end
  
  # def show 
  #   @user = User.find(params[:id]) 
  # end
  
  def edit
    @user = User.find(params[:id])
  end 
end  




