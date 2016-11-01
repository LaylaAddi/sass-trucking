class DriverUsersController < UsersController 
  before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy]
  
  def index
  	@search = DriverUser.search(params[:q])
  	@drivers = @search.result.order(:id).page(params[:page]).per(1000) 

    respond_to do |format|
      format.html
      format.csv { send_data @drivers.as_csv } 
    end
  end
  

  def update
    @user = User.find(params[:id])
    if params[:driver_user][:password].blank?
      params[:driver_user].delete(:password)
      params[:driver_user].delete(:password_confirmation) 
    end
    
    if @user.update!(user_params)
      flash[:success] = "The user was updated"
      redirect_to root_path
    else
      flash[:error] = "There was a problem" 
      render :edit  
    end
  end 
  
  def show 
    @driver = DriverUser.find(params[:id]) 
    
    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @complete = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @paid = @driver.loads.where(["status_name = ?", "Paid"])
  	@search_paid = @paid.search(params[:q])
  	@paid_loads = @search_paid.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  	@trucks = @driver.trucks 
  	@trailers = @driver.trailers 
  end
    
  def driver_dashboard
    @driver = current_driver_user

    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @complete = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @paid = @driver.loads.where(["status_name = ?", "Paid"])
  	@search_paid = @paid.search(params[:q])
  	@paid_loads = @search_paid.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  	@trucks = @driver.trucks 
  	@trailers = @driver.trailers 
  end
 
  def import
    @import = DriverUser.import(params[:file])
    flash[:success] = 'Drivers have been imported!'
    redirect_to driver_users_path
  end

  
  private
  

    
    def validate_driver_user
      if !current_driver_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end

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