class LoadsController < ApplicationController
  before_action :validate_admin_user, only: [:destroy]
  before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy] 
  before_action :set_load, only: [:show, :edit, :update, :destroy]


  def index
    @all_loads = Load.all
  	@search_loads = @all_loads.search(params[:q])
  	@loads = @search_loads.result.order(:id).page(params[:page]).per(1000)
  	
    respond_to do |format|
      format.html
      format.csv { send_data @loads.as_csv }  
    end
  end


  def show
    @company_profile = @load.company_profile    
    @transactions = @load.transactions  
    @vendor_profile = VendorProfile.all
    @load_doc = @load.load_documents 
    @driver = @load.driver_user
    @cd_transactions = @load.transactions.where(["expense_type = ?", "Cash Advance"])
     
    
    @all_origin_addresses = @load.load_origin_addresses.all
    @load_origin_address = @all_origin_addresses.find_by(order: "1")  

    @all_destination_addresses = @load.load_destination_addresses.all
    @load_destination_address = @all_destination_addresses.find_by(order: "12")  


    @load_origin_addresses = @load.load_origin_addresses.where.not(order: "1").order('created_at ASC')
    @load_destination_addresses = @load.load_destination_addresses.where.not(order: "12").order('created_at ASC')
    

    @driver_checkins = @driver.driver_checkins.order('created_at ASC')
    
    @last_checkin = @driver.driver_checkins.order('created_at ASC').last
    
    

    
    #gets latitude column
    @lat = @driver.driver_checkins.pluck(:latitude)
    #gets latest record
    @latitude = @lat.last(1)

    # logic to provide default values if no checkin present
    if 
      @latitude.present? 
      #join removes brackets from array - only shows coords
      @driver_latitude = @latitude.join(', ')
    else
      @driver_latitude = "41.881832"
    end
    

    @lng = @driver.driver_checkins.pluck(:longitude)
    @longitude = @lng.last(1)

    if 
      @longitude.present? 
      @driver_longitude = @longitude.join(', ')
    else
      @driver_longitude = "-87.623177"
    end
   
    @distance = Geocoder::Calculations.distance_between([@load_origin_address.latitude,@load_origin_address.longitude], [@load_destination_address.latitude,@load_destination_address.longitude]) 
    

        
  end


  def new
    @load = current_hrc_user.loads.build 
    @load.load_origin_addresses.build
    @load.load_destination_addresses.build
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @company_profile = CompanyProfile.all

  end


  def edit
    @load_driver = @load.driver_user
    @driver = DriverUser.where(["employment_status = ?", "active"])
    @hrc_user = current_hrc_user
    @company_profile = CompanyProfile.all   
    
    @all_origin_addresses = @load.load_origin_addresses.all
    @load_origin_address = @all_origin_addresses.find_by(order: "1")  
    
    @all_destination_addresses = @load.load_destination_addresses.all
    @load_destination_address = @all_destination_addresses.find_by(order: "12")
    
    @load_origin_addresses = @load.load_origin_addresses.where.not(order: "1").order('created_at ASC')
    @load_destination_addresses = @load.load_destination_addresses.where.not(order: "12").order('created_at ASC')
    
    @driver_checkins = @load_driver.driver_checkins.order('created_at ASC')
    
    @last_checkin = @load_driver.driver_checkins.order('created_at ASC').last
    #gets latitude column
    @lat = @load_driver.driver_checkins.pluck(:latitude)
    #gets latest record
    @latitude = @lat.last(1)

    # logic to provide default values if no checkin present
    if 
      @latitude.present? 
      #join removes brackets from array - only shows coords
      @driver_latitude = @latitude.join(', ')
    else
      @driver_latitude = "41.881832"
    end
    

    @lng = @load_driver.driver_checkins.pluck(:longitude)
    @longitude = @lng.last(1)

    if 
      @longitude.present? 
      @driver_longitude = @longitude.join(', ')
    else
      @driver_longitude = "-87.623177"
    end
   
 
  end


  def create
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @company_profile = CompanyProfile.all  
    @load = current_hrc_user.loads.build(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        flash[:error] = @load.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @driver = DriverUser.where(["employment_status = ?", "active"]) 
    @company_profile = CompanyProfile.all  
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        flash[:error] = @load.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    Load.import(params[:file])
    redirect_to loads_path, notice: 'Loads have been uploaded.'
  end  

  private
    def validate_admin_user
      if !current_hrc_user.admin? 
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end
    



    def set_load
      @load = Load.find(params[:id])
    end


    def load_params
      params.require(:load).permit(
                                    :commodity, 
                                    :weight, 
                                    :units, 
                                    :load_size, 
                                    :rate, 
                                    :percent_deducted,      
                                    :miles,
                                    :pick_up_date,
                                    :pick_up_time,
                                    :delivery_date,
                                    :delivery_time,
                                    :equipment_type, 
                                    :status_name,
                                    :driver_user_id,
                                    :updated_by,
                                    :pick_up_notes,
                                    :delivery_notes,
                                    :special_instructions,
                                    :dimentions,
                                    :destination_street,
                                    :destination_city,  
                                    :destination_state,
                                    :destination_zip,
                                    :origin_street,
                                    :origin_city,  
                                    :origin_state,
                                    :origin_zip,
                                    :origin_latitude,
                                    :origin_longitude,
                                    :destination_latitude,
                                    :destination_longitude,
                                    :origin_phone,
                                    :origin_contact,
                                    :destination_phone,
                                    :destination_contact,
                                    :consignor_name,
                                    :consignee_name,
                                    :company_profile_id,
                                    :broker_shipper_load_id,
                                    :delivery_time_notes,
                                    :total_hrc_expenses,
                                    :booking_fee,
                                    :invoice_price,
                                    :driver_statement_id,
                                    :rate_to_driver,
                                    :rate_after_percent,
                                    :rate_after_booking_fee,
                                    :rate_to_driver_after_factor_fees, 
                                    :agent_fee, 
                                    load_origin_addresses_attributes: 
                                      [
                                      :street,
                                      :city, 
                                      :state, 
                                      :zip,
                                      :type,
                                      :company,
                                      :notes,
                                      :contact,
                                      :phone,
                                      :order
                                      ],
                                      load_destination_addresses_attributes:  
                                        [
                                        :street,
                                        :city, 
                                        :state, 
                                        :zip,
                                        :type,
                                        :company,
                                        :notes,
                                        :contact,
                                        :phone,
                                        :order
                                        ]
                                        )
    end
end

