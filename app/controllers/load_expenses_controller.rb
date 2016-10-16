class LoadExpensesController < ApplicationController
  before_action :set_load_expense, only: [:show, :edit, :update, :destroy]
  before_action :validate_hrc_user

  # GET /load_expenses
  # GET /load_expenses.json
  def index
    @load_expenses = LoadExpense.all
  end

  # GET /load_expenses/1
  # GET /load_expenses/1.json
  def show
    @load = Load.find(params[:load_id])  
  end

  # GET /load_expenses/new
  def new
    @load = Load.find(params[:load_id])
    @load_expense = @load.load_expenses.new
    @vendor_profile = VendorProfile.all
  end 

  # GET /load_expenses/1/edit
  def edit
    @load = Load.find(params[:load_id])
    @vendor_profile = VendorProfile.all
  end

  # POST /load_expenses
  # POST /load_expenses.json
  def create
    @load = Load.find(params[:load_id])
    @load_expense = @load.load_expenses.create(load_expense_params)

    respond_to do |format|
      if @load_expense.save
        format.html { redirect_to @load, notice: 'Load expense was successfully created.' }
        format.json { render :show, status: :created, location: @load_expense }
      else
        format.html { render :new }
        format.json { render json: @load_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /load_expenses/1
  # PATCH/PUT /load_expenses/1.json
  def update
    @load = Load.find(params[:load_id])
    respond_to do |format|
      if @load_expense.update(load_expense_params)
        format.html { redirect_to @load, notice: 'Load expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_expense }
      else
        format.html { render :edit }
        format.json { render json: @load_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_expenses/1
  # DELETE /load_expenses/1.json
  def destroy
    @load = Load.find(params[:load_id])
    @load_expense.destroy
    respond_to do |format|
      format.html { redirect_to @load, notice: 'Load expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def validate_hrc_user
      !current_hrc_user flash[:danger] = "Stay Out!"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_load_expense
      @load_expense = LoadExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_expense_params
      params.require(:load_expense).permit(
                                            :expense_type, 
                                            :latitude, 
                                            :longitude, 
                                            :amount, 
                                            :street, 
                                            :city, 
                                            :state, 
                                            :zip, 
                                            :business_name, 
                                            :load_id,
                                            :vendor_profile_id
                                            )
    end
end
