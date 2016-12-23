class DriverCheckinsController < ApplicationController
  before_action :set_driver_checkin, only: [:show, :edit, :update, :destroy]

  # GET /driver_checkins
  # GET /driver_checkins.json
  def index
    @driver_checkins = DriverCheckin.all
  end

  # GET /driver_checkins/1
  # GET /driver_checkins/1.json
  def show
  end

  # GET /driver_checkins/new
  def new
    @driver_checkin = DriverCheckin.new
  end

  # GET /driver_checkins/1/edit
  def edit
  end

  # POST /driver_checkins
  # POST /driver_checkins.json
  def create
    @driver_checkin = DriverCheckin.new(driver_checkin_params)

    respond_to do |format|
      if @driver_checkin.save
        format.html { redirect_to @driver_checkin, notice: 'Driver checkin was successfully created.' }
        format.json { render :show, status: :created, location: @driver_checkin }
      else
        format.html { render :new }
        format.json { render json: @driver_checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver_checkins/1
  # PATCH/PUT /driver_checkins/1.json
  def update
    respond_to do |format|
      if @driver_checkin.update(driver_checkin_params)
        format.html { redirect_to @driver_checkin, notice: 'Driver checkin was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver_checkin }
      else
        format.html { render :edit }
        format.json { render json: @driver_checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_checkins/1
  # DELETE /driver_checkins/1.json
  def destroy
    @driver_checkin.destroy
    respond_to do |format|
      format.html { redirect_to driver_checkins_url, notice: 'Driver checkin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_checkin
      @driver_checkin = DriverCheckin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_checkin_params
      params.require(:driver_checkin).permit(:street, :city, :state, :zip, :latitude, :longitude, :status, :notes, :driver_user_id)
    end
end
