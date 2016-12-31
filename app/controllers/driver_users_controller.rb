class DriverUsersController < UsersController 
  include ApplicationHelper
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
    
    if @user.update(user_params)
      flash[:success] = "The user was updated"
      redirect_to @user
    else
        flash[:error] = @user.errors.full_messages.to_sentence
      render :edit  
    end
  end 
  
  def show 
    @driver = DriverUser.find(params[:id]) 
    @hrc_user = current_hrc_user
  	@driver_statements = @driver.driver_statements if !nil? 
    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
    @loads_no_statement = @driver.loads.where("driver_statement_id is NULL")
    @complete = @loads_no_statement.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	@trucks = @driver.trucks 
  	@trailers = @driver.trailers 
    #@text_load = @active.last 
    @message = Message.last
    @messages = Message.all.order('created_at desc')
    @driver_checkins = @driver.driver_checkins
    # @ip = request.remote_ip 
    # @location = Geocoder.coordinates(@ip)
    # @lat = request.location.latitude 
    # @lon = request.location.longitude
    # @city = request.location.city
    # @region = request.location.region
    #@postal_code = request.location.zip_code

  end
    
  def driver_dashboard
    @driver = current_driver_user
  	@driver_statements = @driver.driver_statements if !nil? 
    @active = @driver.loads.where(["status_name = ?", "Active"])
  	@search_active = @active.search(params[:q])
  	@active_loads = @search_active.result.order(:id).page(params[:page]).per(1000) 
  	
    @loads_no_statement = @driver.loads.where("driver_statement_id is NULL")
    @complete = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_complete = @complete.search(params[:q])
  	@completed_loads = @search_complete.result.order(:id).page(params[:page]).per(1000) 
  	
    @cancelled = @driver.loads.where(["status_name = ?", "Complete"])
  	@search_cancelled = @cancelled.search(params[:q])
  	@completed_loads = @search_cancelled.result.order(:id).page(params[:page]).per(1000) 
  	
  	@trucks = @driver.trucks 
  	@trailers = @driver.trailers 
  	
    @driver_checkin = DriverCheckin.new
    @driver_checkins = @driver.driver_checkins
    
    @ip = request.remote_ip 
    @location = Geocoder.coordinates(@ip)
    # latitude = params[:latitude]
    # longitude = params[:longitude]
    # @lat = request.location.latitude  
    # @lon = request.location.longitude
    # @city = request.location.city
    # @region = request.location.region
    #@postal_code = request.location.zip_code
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
                                        :employment_status,
                                        :company_driver, 
                                        :driver_rpm,
                                        :time_zone,
                                        :company_driver,
                                        :owner_operator
                                        )
                              
  end
end