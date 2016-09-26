class ShipmentUsersController < ApplicationController
  #before_action :authenticate_shipper!
  
  def index
    @search = ShipmentUser.search(params[:q])
    @users = @search.result.order(:id).page(params[:page]).per(25)
    @count = ShipmentUser.all
  end
  
  def show
    @user = ShipmentUser.find(params[:id])
  end  


  def edit
    @user = ShipmentUser.find(params[:id])
  end    
  

  def update
    @user =ShipmentUser.find(params[:id])
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
                                          :mobile_email,
                                          :street, 
                                          :city, 
                                          :state, 
                                          :zip,  
                                          :type,
                                          :emergency_contact,
                                          :emergency_contact_number,
                                          :company_admin
                                          )                           

 
  end  
end