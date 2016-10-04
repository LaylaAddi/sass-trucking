class LoadAddressesController < ApplicationController
  before_action :set_load_address, only: [:show, :edit, :update, :destroy]

  # GET /load_addresses
  # GET /load_addresses.json
  def index
    @load_addresses = LoadAddress.all
  end

  # GET /load_addresses/1
  # GET /load_addresses/1.json
  def show
    
  end

  # GET /load_addresses/new
  def new
    @load = Load.find(params[:load_id])
    @load_address = @load.load_addresses.build
  end

  # GET /load_addresses/1/edit
  def edit
  end

  # POST /load_addresses
  # POST /load_addresses.json
  def create
    @load = Load.find(params[:load_id])
    @load_address = @load.load_addresses.new(load_address_params)

    respond_to do |format|
      if @load_address.save
        format.html { redirect_to @load, notice: 'Load address was successfully created.' }
        format.json { render :show, status: :created, location: @load_address }
      else
        format.html { render :new }
        format.json { render json: @load_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /load_addresses/1
  # PATCH/PUT /load_addresses/1.json
  def update
    respond_to do |format|
      if @load_address.update(load_address_params)
        format.html { redirect_to @load, notice: 'Load address was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_address }
      else
        format.html { render :edit }
        format.json { render json: @load_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_addresses/1
  # DELETE /load_addresses/1.json
  def destroy
    @load_address.destroy
    respond_to do |format|
      format.html { redirect_to load_addresses_url, notice: 'Load address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load_address
      @load_address = LoadAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_address_params
      params.require(:load_address).permit(:address_type, :street, :latitude, :longitude, :street2, :city, :state, :zip, :company, :contact, :phone, :load_id)
    end
end
