class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]


  def index
    @companies = Company.all
  end


  def show
    @company_manager = CompanyManager.find(params[:id])
    @bmc = @company.broker_mcs
    @cmc = @company.carrier_mcs
  end


  def new
    @company = Company.new
  end


  def edit
  end


  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end


    def company_params
      params.require(:company).permit(
        :name, 
      :address, 
      :telephone, 
      :website, 
      :logo, 
      :broker_mc, 
      :carrier_mc, 
      :us_dot, 
      :company_manager_id,
      :date_formed,
      :company_type,
      :has_broker_mc,
      :has_carrier_mc
      )
    end
end
