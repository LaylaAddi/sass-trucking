class VendorProfilesController < ApplicationController
  before_action :set_vendor_profile, only: [:show, :edit, :update, :destroy]

  # GET /vendor_profiles
  # GET /vendor_profiles.json
  def index
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @vendor_profiles = @company_profile.vendor_profiles
  end 

  # GET /vendor_profiles/1
  # GET /vendor_profiles/1.json
  def show
    @company_profile = CompanyProfile.find(params[:company_profile_id])
  end

  # GET /vendor_profiles/new
  def new
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @vendor_profile = @company_profile.vendor_profiles.new
  end

  # GET /vendor_profiles/1/edit
  def edit
    @company_profile = CompanyProfile.find(params[:company_profile_id]) 
  end

  # POST /vendor_profiles
  # POST /vendor_profiles.json
  def create 
    @company_profile = CompanyProfile.find(params[:company_profile_id])
    @vendor_profile = @company_profile.vendor_profiles.new(vendor_profile_params)

    respond_to do |format|
      if @vendor_profile.save
        format.html { redirect_to @company_profile, notice: 'Vendor profile was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_profile }
      else
        flash[:error] = @vendor_profile.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @vendor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_profiles/1
  # PATCH/PUT /vendor_profiles/1.json
  def update
    respond_to do |format|
      if @vendor_profile.update(vendor_profile_params)
        format.html { redirect_to company_profile_vendor_profile_path(@company_profile), 
        notice: 'Vendor profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_profile }
      else
        flash[:error] = @vendor_profile.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @vendor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_profiles/1
  # DELETE /vendor_profiles/1.json
  def destroy
    @vendor_profile.destroy
    respond_to do |format|
      format.html { redirect_to vendor_profiles_url, notice: 'Vendor profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_profile
      @vendor_profile = VendorProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_profile_params
      params.require(:vendor_profile).permit(:company_name, :street, :city, :state, :zip, :telephone, :fax, :website, :logo, :contact_name, :email, :company_profile_id)
    end
end
