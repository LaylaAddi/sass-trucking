class StatementsController < ApplicationController
  before_action :set_statement, only: [:show, :edit, :update, :destroy]

  # GET /statements
  # GET /statements.json
  def index

    @driver = DriverUser.find(params[:driver_user_id]) 
    @statements = @driver.statements 
  end

  # GET /statements/1
  # GET /statements/1.json
  def show
    @driver = DriverUser.find(params[:driver_user_id]) 
  end

  # GET /statements/new
  def new
    @driver = DriverUser.find(params[:driver_user_id])
    @statement = @driver.statements.build
  end

  # GET /statements/1/edit
  def edit
    @driver = DriverUser.find(params[:driver_user_id])
  end

  # POST /statements
  # POST /statements.json 
  def create
    @driver = DriverUser.find(params[:driver_user_id])
    @statement = @driver.statements.build(statement_params)

    respond_to do |format|
      if @statement.save
        format.html { redirect_to driver_user_statement_path(@driver, @statement), notice: 'Statement was successfully created.' }
        format.json { render :show, status: :created, location: @statement }
      else
        flash[:error] = @statement.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statements/1
  # PATCH/PUT /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to driver_user_statements_path(@statement), notice: 'Statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @statement }
      else
        flash[:error] = @statement.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1
  # DELETE /statements/1.json
  def destroy
    @statement.destroy
    respond_to do |format|
      format.html { redirect_to driver_user_statements_path, notice: 'Statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statement_params
      params.require(:statement).permit(
                                          :insurance_payment, 
                                          :trailer_rental, 
                                          :truck_rental, 
                                          :escrow, 
                                          :driver_user_id
                                          )
    end
end
