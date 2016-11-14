class DriverStatementsController < ApplicationController
  before_action :set_driver_statement, only: [:show, :edit, :update, :destroy]

  # GET /driver_statements
  # GET /driver_statements.json
  def index
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statements = DriverStatement.all
  end

  # GET /driver_statements/1
  # GET /driver_statements/1.json
  def show
    @driver = DriverUser.find(params[:driver_user_id]) 
    @loads = @driver_statement.loads.order(:id)
  end

  # GET /driver_statements/new
  def new
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statement = @driver.driver_statements.new
    #@loads = @driver.loads.where(["status_name = ?", "Complete"]).order(:id) 
    @loads = @driver.loads.where("driver_statement_id is NULL") 
  end

  def edit
    @driver = DriverUser.find(params[:driver_user_id])
    @loads = @driver_statement.loads
  end

  # POST /driver_statements
  # POST /driver_statements.json
  def create
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statement = @driver.driver_statements.new(driver_statement_params)
    @loads = @driver.loads.where(["status_name = ?", "Complete"]) 

    respond_to do |format|
      if @driver_statement.save
        format.html { redirect_to driver_user_driver_statement_path(@driver, @driver_statement), notice: 'Driver statement was successfully created.' }
        format.json { render :show, status: :created, location: @driver_statement }
      else
        flash[:error] = @driver_statement.errors.full_messages.to_sentence
        format.html { redirect_to @driver }
        format.json { render json: @driver_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver_statements/1
  # PATCH/PUT /driver_statements/1.json
  def update
    @driver = DriverUser.find(params[:driver_user_id])
    @loads = @driver.loads.where(["status_name = ?", "Complete"]) 
    respond_to do |format|
      if @driver_statement.update(driver_statement_params)
        format.html { redirect_to @driver, notice: 'Driver statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver_statement }
      else
        flash[:error] = @driver_statement.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @driver_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_statements/1
  # DELETE /driver_statements/1.json
  def destroy
    @driver = DriverUser.find(params[:driver_user_id])
    @driver_statement.destroy
    respond_to do |format|
      format.html { redirect_to driver_user_driver_statements_url, notice: 'Driver statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_statement
      @driver_statement = DriverStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_statement_params
      params.require(:driver_statement).permit(
          :notes,
          :insurance_payment,
          :trailer_rental,
          :truck_rental,
          :other,
          :payment_status, 
          :due_date, 
          :driver_user_id, 
          :payment_notes,
          load_ids: [] 
          )
    end
end

