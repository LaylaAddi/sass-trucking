class LoadFinancialsController < ApplicationController
  before_action :set_load_financial, only: [:show, :edit, :update, :destroy]

  def index
    @load_financials = LoadFinancial.all
  end


  def show
  end


  def new
    @load_financial = @load.load_financial.build
  end


  def edit
    @load = Load.find(params[:load_id])
  end


  def create
    @load = Load.find(params[:load_id])
    @load_financial = @load.load_financial.build(load_financial_params)

    respond_to do |format|
      if @load_financial.save
        format.html { redirect_to @load_financial, notice: 'Load financial was successfully created.' }
        format.json { render :show, status: :created, location: @load_financial }
      else
        format.html { render :new }
        format.json { render json: @load_financial.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
    @load = Load.find(params[:load_id])
      if @load_financial.update(load_financial_params)
        format.html { redirect_to @load_financial, notice: 'Load financial was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_financial }
      else
        format.html { render :edit }
        format.json { render json: @load_financial.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @load_financial.destroy
    respond_to do |format|
      format.html { redirect_to load_financials_url, notice: 'Load financial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_load_financial
      @load_financial = LoadFinancial.find(params[:id])
    end


    def load_financial_params
      params.require(:load_financial).permit(
                                              :gross_rate, 
                                              :percent_deducted, 
                                              :miles, 
                                              :gross_rpm, 
                                              :percent_deducted, 
                                              :dollars_deducted_based_on_percent, 
                                              :gross_rate_after_percent, 
                                              :after_percent_deducted_rpm, 
                                              :load_expense, 
                                              :net_load_rate, 
                                              :net_rpm, 
                                              :load_id
                                              ) 
    end
end
