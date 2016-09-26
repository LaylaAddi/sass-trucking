class OfficeUsersController < ApplicationController
  

  def index
    @search = OfficeUser.search(params[:q])
    @users = @search.result.order(:id).page(params[:page]).per(25)
    @count = OfficeUser.all
  end
  
  def show
    @user = OfficeUser.find(params[:id])
  end  



  def edit
    @user = OfficeUser.find(params[:id])
  end    
  
  
  def update
    @user = OfficeUser.find(params[:id])
    if params[:office_user][:password].blank?
      params[:office_user].delete(:password)
      params[:office_user].delete(:password_confirmation)
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to @office_user
    else
      flash[:error] = "There was a problem updating this user" 
      render :edit  
    end
  end
  


  
  private

  def user_params
    params.require(:office_user).permit(:password, 
                                        :password_confirmation,
                                        :current_password,
                                        :email,
                                        :first_name,
                                        :last_name,
                                        :telephone,
                                        :extention,
                                        :mobile_email,
                                        :street, 
                                        :city, 
                                        :state, 
                                        :zip,  
                                        :type,
                                        :emergency_contact,
                                        :emergency_contact_number,
                                        :company_admin,
                                        :admin,
                                        :dispatcher                              
                                        )
 
  end  
end