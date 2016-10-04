class UsersController < ApplicationController
  
  def dashboard
    @user = current_user 
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end 
  
  

end  

class HrcUsersController < UsersController 

  def update
    @user = User.find(params[:id])
    if params[:hrc_user][:password].blank? 
      params[:hrc_user].delete(:password)
      params[:hrc_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to user_path(@user)
    else
      flash[:error] = "There was a problem" 
      render :edit  
    end
  end 
private

  def user_params
    params.require(:hrc_user).permit(:password, 
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
                                     :emergency_contact_number,
                                     :company_profile_admin,
                                     :admin,
                                     :dispatcher,
                                     :office,
                                     :maintenance,
                                     :shipping_receiving,
                                     :driver,
                                     :employment_status 
                                     )
                              
  end
end



class ShipperUsersController < UsersController 

  def update
    @user = User.find(params[:id])
    if params[:shipper_user][:password].blank?
      params[:shipper_user].delete(:password)
      params[:shipper_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to user_path(@user)
    else
      flash[:error] = "There was a problem" 
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
                                         :emergency_contact_number,
                                         :company_profile_admin,
                                         :dispatcher,
                                         :office,
                                         :maintenance,
                                         :shipping_receiving,
                                         :driver,
                                         :employment_status 
                                         )
                              
  end
end

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
                                        :emergency_contact_number,
                                        :employment_status
                                        )
                              
  end
end