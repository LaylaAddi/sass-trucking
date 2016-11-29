class AgentTexter < Textris::Base
  default :from => ENV["twilio_number"] 
 
  def alert(params)
    @driver = DriverUser.find(params[:driver_user_id])   
    @params = params
    text :to => '+1'+@driver.cellphone 
  end
end