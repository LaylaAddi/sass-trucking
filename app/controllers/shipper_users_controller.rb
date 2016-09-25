class ShipperUsersController < ApplicationController

  
  def show
    @user = ShipperUser.find(params[:id])
  end  

  def update
    @user = ShipperUser.find(params[:id])
    if params[:shipper_user][:password].blank?
      params[:shipper_user].delete(:password)
      params[:shipper_user].delete(:password_confirmation)
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
    params.require(:shipper_user).permit(:password, 
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