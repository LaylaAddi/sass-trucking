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
    @inbound = @messages.find_by(inbound: 'true') 
 
    @driver = DriverUser.find_by_cellphone(params[:cellphone])
    

  end

  def create
    @hrc_user = current_hrc_user
    message = Message.new(clean_params)
    message.inbound = false

    if message.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  message.text
      head :ok

    end
  end
     

  private

  def clean_params
    params.require(:message).permit(
      :number, 
      :text, 
      :driver_user_id, 
      :user, 
      :body,
      :to_country,
      :to_state,
      :to_city,
      :to_zip,
      :from_country,
      :from_state,
      :from_city,
      :from_zip,
      :sms_message_sid,
      :num_media,
      :sms_sid      
      ) 
  end
end

