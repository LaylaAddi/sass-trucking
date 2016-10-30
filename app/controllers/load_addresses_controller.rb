class LoadAddressesController < ApplicationController
  before_action :set_load_address, only: [:show, :edit, :update, :destroy]
  before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy]
  
  def index
    @load_addresses = LoadAddress.all
  end

  def show
  end

  def new
    @load = Load.find(params[:load_id])
    @load_address = @load.load_addresses.build
  end

  def edit
    @load = Load.find(params[:load_id])
  end


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

  def update
    @load = Load.find(params[:load_id])
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


  def destroy
    @load = Load.find(params[:load_id])
    @load_address.destroy
    respond_to do |format|
      format.html { redirect_to load_path(@load), notice: 'Load address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_load_address
      @load_address = LoadAddress.find(params[:id])
    end

    def load_address_params
      params.require(:load_address).permit(
        :address_type, 
        :street, 
        :latitude, 
        :longitude, 
        :street2, 
        :city, 
        :state, 
        :zip, 
        :company, 
        :contact, 
        :phone, 
        :load_id,
        :notes            
        )
    end
end
