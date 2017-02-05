class AppVariablesController < ApplicationController
  before_action :set_app_variable, only: [:show, :edit, :update, :destroy]

  # GET /app_variables
  # GET /app_variables.json
  def index
    @app_variables = AppVariable.all
  end

  # GET /app_variables/1
  # GET /app_variables/1.json
  def show
  end

  # GET /app_variables/new
  # def new
  #   @app_variable = AppVariable.new
  # end

  # GET /app_variables/1/edit
  def edit
  end

  # POST /app_variables
  # POST /app_variables.json
  def create
    @app_variable = AppVariable.new(app_variable_params)

    respond_to do |format|
      if @app_variable.save
        format.html { redirect_to @app_variable, notice: 'App variable was successfully created.' }
        format.json { render :show, status: :created, location: @app_variable }
      else
        format.html { render :new }
        format.json { render json: @app_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_variables/1
  # PATCH/PUT /app_variables/1.json
  def update
    respond_to do |format|
      if @app_variable.update(app_variable_params)
        format.html { redirect_to @app_variable, notice: 'App variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_variable }
      else
        format.html { render :edit }
        format.json { render json: @app_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_variables/1
  # DELETE /app_variables/1.json
  # def destroy
  #   @app_variable.destroy
  #   respond_to do |format|
  #     format.html { redirect_to app_variables_url, notice: 'App variable was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_variable
      @app_variable = AppVariable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_variable_params
      params.require(:app_variable).permit(
                                            :app_name, 
                                            :app_logo, 
                                            :app_logo_name, 
                                            :app_tab_name, 
                                            :app_slogan, 
                                            :app_favi, 
                                            :app_terms, 
                                            :app_conditions,
                                            :theme
                                            )
    end
end
