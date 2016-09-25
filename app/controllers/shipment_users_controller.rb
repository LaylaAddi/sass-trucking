class ShipmentUsersController < ApplicationController
  before_action :authenticate_shipper!
  
  def dashboard
    @user = current_user
  end  
  
  def show
    @user = ShipmentUser.find(params[:id])
  end  

  def update
    @user =ShipmentrUser.find(params[:id])
    if params[:shipment_user][:password].blank?
      params[:shipment_user].delete(:password)
      params[:shipment_user].delete(:password_confirmation)
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to @user
    else
      flash[:error] = "There was a problem updating this user" 
      render :edit  
    end
  end
  


  
  private

  def user_params
    params.require(:shipment_user).permit(:password, 
                                          :password_confirmation,
                                          :current_password,
                                          :email,
                                          :first_name,
                                          :last_name,
                                          :telephone,
                                          :street, 
                                          :city, 
                                          :state, 
                                          :zip,  
                                          :type                                  
                                          )
 
  end  
end