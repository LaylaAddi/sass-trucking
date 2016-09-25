class UsersController < ApplicationController
  
  def index
    @search = User.search(params[:q])
    @users = @search.result.order(:id).page(params[:page]).per(25)
    @count = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end  

  def edit
    @user = User.find(params[:id])
  end
    
end 