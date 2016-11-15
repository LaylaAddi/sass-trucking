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
    @addresses = @load.load_addresses
    @company_profile = @load.company_profile    
    @transactions = @load.transactions  
    @vendor_profile = VendorProfile.all
    @load_doc = @load.load_documents 
    @driver = @load.driver_user
  end


  def new
    @driver = DriverUser.find(params[:driver_user_id])
    @load = current_hrc_user.loads.build
    @hrc_user = current_hrc_user
    @company_profile = CompanyProfile.all
  end


  def edit
    @company_profile = CompanyProfile.all   
  end


  def create
    @driver = DriverUser.find(params[:driver_user_id])
    @load = current_hrc_user.loads.build(load_params)
    @company_profile = CompanyProfile.all  


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
                                    :pick_up_time_notes,
                                    :delivery_time_notes,
                                    :total_hrc_expenses,
                                    :booking_fee,
                                    :invoice_price,
                                    :driver_statement_id,
                                    :rate_to_driver,
                                    :rate_after_percent,
                                    :rate_after_booking_fee,
                                    :rate_to_driver_after_factor_fees,
                                    :company_driver_rate
                                    )
    end
end

