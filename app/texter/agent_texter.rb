class AgentTexter < Textris::Base
  default :from => ENV["twilio_number"] 
 
  def alert(params)
    @params = params
    text :to => @driver.cellphone 
  end
end