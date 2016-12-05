class MessagesController < ApplicationController
  include ApplicationHelper
 skip_before_filter :verify_authenticity_token
  before_action :authenticate_hrc_user! 
 
  def index
    @hrc_user = current_hrc_user
    @messages = Message.all
  end

  def show
    @hrc_user = current_hrc_user
    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])

  end

  def create
    @hrc_user = current_hrc_user
    message = Message.new(clean_params)
    message.inbound = false

    if message.save
     flash[:success] = "Your Text has been sent"
      send_cable(message)
      send_sms(message)

      redirect_to message_path(message.number)
     else
       flash[:danger] = "There was a problem sending the message"
        redirect_back(fallback_location: root_path)
    end
  end
     

  private

  def clean_params
    params.require(:message).permit(:number, :text, :driver_user_id, :user)
  end
end

