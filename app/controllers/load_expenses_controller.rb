class LoadExpensesController < ApplicationController
  before_action :set_load_expense, only: [:show, :edit, :update, :destroy]
  before_action :validate_hrc_user, only: [:edit, :update, :new, :destroy]


  def index
    @load_expenses = LoadExpense.all
  end


  def show
    @load = Load.find(params[:load_id])  
  end


  def new
    @load = Load.find(params[:load_id])
    @load_expense = @load.load_expenses.new
    @vendor_profile = VendorProfile.all
  end 


  def edit
    @load = Load.find(params[:load_id])
    @vendor_profile = VendorProfile.all
  end


  def create
    @vendor_profile = VendorProfile.all
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


  def destroy
    @load = Load.find(params[:load_id])
    @load_expense.destroy
    respond_to do |format|
      format.html { redirect_to @load, notice: 'Load expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  

    def set_load_expense
      @load_expense = LoadExpense.find(params[:id])
    end
    
    def validate_hrc_user
      if !current_hrc_user
        redirect_to root_path
      flash[:danger] = " #{current_user.first_name}, The function requested does not exist or you are not authorized for access."
      end
    end

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
