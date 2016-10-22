git add -A
git commit -m "merger loadpl"
git push -u origin master 


 <%= link_to "new statement", new_driver_user_load_statement_path(@driver) %>


    @load_statement = LoadStatement.find(params[:load_statement_id]) 
    
      <%= f.collection_select :load_payment_category_id, 
              LoadPaymentCategory.order(:name),
              :id,:name, include_blank: true %>

<%= f.select :load_payment_category_ids, 
LoadPaymentCategory.all.collect {|x| [x.origin_city, x.id]}, {}, :multiple => true %>

class LoadStatementsController < ApplicationController
  before_action :set_load_statement, only: [:show, :edit, :update, :destroy]


  def index
    @driver = DriverUser.find(params[:driver_user_id])
    @load_statements = LoadStatement.all
  end


  def show
    @driver = DriverUser.find(params[:driver_user_id])
  end


  def new
    @driver = DriverUser.find(params[:driver_user_id])
    @load_statement = @driver.load_statements.new
    @loads = @driver.loads 
    @load_statement_load = @load_statement.statement_loads.build
  end


  def edit
    @driver = DriverUser.find(params[:driver_user_id])
  end

  # POST /load_statements
  # POST /load_statements.json
  def create
    @driver = DriverUser.find(params[:driver_user_id])
    @load_statement = @driver.load_statements.new(load_statement_params)

      # params[:loads][:id].each do |load|
      #   @load_statement.statement_loads.build(load_id: load)
      # end
        
    respond_to do |format|
      if @load_statement.save
        format.html { redirect_to driver_user_load_statement_path(@driver, @load_statement), notice: 'Load statement was successfully created.' }
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
    @driver = DriverUser.find(params[:driver_user_id])
    respond_to do |format|
      if @load_statement.update(load_statement_params)
        format.html { redirect_to driver_user_load_statement_path(@driver, @load_statement), notice: 'Load statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @load_statement }
      else
        flash[:error] = @load_statement.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @load_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /load_statements/1
  # DELETE /load_statements/1.json
  def destroy
    @driver = DriverUser.find(params[:driver_user_id])
    @load_statement.destroy
    respond_to do |format|
      format.html { redirect_to driver_user_load_statements_url, 
      notice: 'Load statement was successfully destroyed.' }
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
                                              :driver_user,
                                              statement_load_ids: []
                                              )
    end
end

