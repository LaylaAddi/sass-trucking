class DriverUsersController < UsersController 

  def update
    @user = User.find(params[:id])
    if params[:driver_user][:password].blank?
      params[:driver_user].delete(:password)
      params[:driver_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to users_path(@user)
    else
      flash[:error] = "There was a problem" 
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
                                        :extention,
                                        :cellphone,
                                        :street, 
                                        :city, 
                                        :state, 
                                        :zip,  
                                        :type,
                                        :image, 
                                        :profile_image,
                                        :emergency_contact,
                                        :emergency_contact_number
                                        )
                              
  end
end