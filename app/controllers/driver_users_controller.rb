class DriverUsersController < ApplicationController
  
  def index
    @search = DriverUser.search(params[:q])
    @users = @search.result.order(:id).page(params[:page]).per(25)
    @count = DriverUser.all
  end
  
  def show
    @user = DriverUser.find(params[:id])
  end  
  

  def edit
    @user= DriverUser.find(params[:id])
  end  
  
  
  def update
    @user= DriverUser.find(params[:id])
    if params[:driver_user][:password].blank?
      params[:driver_user].delete(:password)
      params[:driver_user].delete(:password_confirmation)
    end
    
    if @driver_user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to @driver_user
    else
      flash[:error] = "There was a problem updating this user" 
      render :edit  
    end
  end
  


  
  private


  
  def user_params
    params.require(:driver_user).permit(:password, 
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
                                        :company_admin,
                                        )
 
  end  
end