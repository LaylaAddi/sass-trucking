class DispatchUsersController < ApplicationController
  

  def show
    @user = DispatchUser.find(params[:id])
  end  
  
  
  def update
    @user = DispatchUser.find(params[:id])
    if params[:dispatch_user][:password].blank?
      params[:dispatch_user].delete(:password)
      params[:dispatch_user].delete(:password_confirmation)
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
    params.require(:dispatch_user).permit(:password, 
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