class UsersController < ApplicationController
  
  def dashboard
    @company_user = current_company_user
    @app_user = current_app_user
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

class AppUsersController < UsersController 

  def update
    @user = User.find(params[:id])
    if params[:app_user][:password].blank?
      params[:app_user].delete(:password)
      params[:app_user].delete(:password_confirmation) 
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
    params.require(:app_user).permit(:password, 
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
                                    :driver 
                                    )
                              
  end
end

class CompanyUsersController < UsersController 

  def update
    @user = User.find(params[:id])
    if params[:company_user][:password].blank?
      params[:company_user].delete(:password)
      params[:company_user].delete(:password_confirmation) 
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
    params.require(:company_user).permit(:password, 
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
                                        :driver 
                                        )
                              
  end
end

