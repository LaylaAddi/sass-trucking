class MessagesController < ApplicationController
  include ApplicationHelper
 skip_before_filter :verify_authenticity_token
 skip_before_action :authenticate_user! 
 
  def index
    @messages = Message.all
  end

  def show

    @messages = Message.for_number(params[:id])
    @new_message = Message.new(number: params[:id])

  end

  def create
    message = Message.new(clean_params)
    message.inbound = false

    if message.save
      send_cable(message)
      send_sms(message)
      redirect_to message_path(message.number)
    end
  end

  private

  def clean_params
    params.require(:message).permit(:number, :text, :driver_user_id)
  end
end

