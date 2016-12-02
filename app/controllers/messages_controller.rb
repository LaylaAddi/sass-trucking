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
    Nexmo::Client.new.send_message(
      from: ENV['NEXMO_NUMBER'],
      to: message.number,
      text: message.text
    )

      redirect_to :back 
    end
  end

  private

  def clean_params
    params.require(:message).permit(:number, :text)
  end
end
