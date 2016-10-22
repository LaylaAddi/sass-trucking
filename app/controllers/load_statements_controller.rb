class LoadStatementsController < ApplicationController
  before_action :set_load_statement, only: [:show, :edit, :update, :destroy]

  # GET /load_statements
  # GET /load_statements.json
  def index
    @load_statements = LoadStatement.all
  end

  # GET /load_statements/1
  # GET /load_statements/1.json
  def show
  end

  # GET /load_statements/new
  def new
    @load_statement = LoadStatement.new
    @loads = Load.all
    @statement_load = @load_statement.statement_loads.build
  end

  # GET /load_statements/1/edit
  def edit
  end

  # POST /load_statements
  # POST /load_statements.json
  def create

    @load_statement = LoadStatement.new(load_statement_params)

    respond_to do |format|
      if @load_statement.save
        format.html { redirect_to @load_statement, notice: 'Load statement was successfully created.' }
        format.json { render :show, status: :created, location: @load_statement }
      else
        flash[:error] = @load_statement.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @load_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /load_statements/1
  # PATCH/PUT /load_statements/1.json
  def update
    respond_to do |format|
      if @load_statement.update(load_statement_params)
        format.html { redirect_to @load_statement, notice: 'Load statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_statement }
      else
        format.html { render :edit }
        format.json { render json: @load_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_statements/1
  # DELETE /load_statements/1.json
  def destroy
    @load_statement.destroy
    respond_to do |format|
      format.html { redirect_to load_statements_url, notice: 'Load statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load_statement
      @load_statement = LoadStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_statement_params
      params.require(:load_statement).permit(
                                              :trailer_rent, 
                                              :truck_rent, 
                                              :insurance, 
                                              :notes,
                                              :statement_load_ids,
                                              statement_load_ids: [],
                                              statement_loads_attributes: [
                                                :statement_load_ids,
                                                :statement_load_id,
                                                :load_id,
                                                :id,
                                                :_destroy,
                                                statement_load_ids: [] 
                                                
                                                ]
                                              )
    end
end
