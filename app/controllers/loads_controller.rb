class LoadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_load, only: [:show, :edit, :update, :destroy]


  def index
    @loads = Load.all
  end


  def show
    @addresses = @load.load_addresses
  end


  def new
    @load = current_user.loads.build
    @driver = DriverUser.where(["employment_status = ?", "active"])
    @company_profile = CompanyProfile.all
  end


  def edit
    @driver = DriverUser.where(["employment_status = ?", "active"])
    @hrc_user = current_user
    @company_profile = CompanyProfile.all   
  end


  def create
    @load = current_user.loads.build(load_params)
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
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
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

  private

    def set_load
      @load = Load.find(params[:id])
    end


    def load_params
      params.require(:load).permit(
        :name,
        :commodity, 
        :weight, 
        :units, 
        :load_size, 
        :rate, 
        :distance, 
        :pick_up_date,
        :pick_up_time,
        :delivery_date,
        :delivery_time,
        :equipment_type, 
        :status_name,
        :driver_user_id,
        :updated_by,
        :pick_up_notes,
        :delevery_notes,
        :special_instructions,
        :dimentions,
        :destination_street,
        :destination_street2,
        :destination_city,  
        :destination_state,
        :destination_zip,
        :origin_street,
        :origin_street2,
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
        :company_profile_ids 
        )
    end
end

