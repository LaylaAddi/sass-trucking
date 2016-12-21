class Conversations::TextMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, except: [:reply]

  def index

    @messages = @conversation.messages.order("created_at ASC")
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)

    # Set the fields to the proper values since the only thing sent is the body
    @message.update(to: @conversation.driver_user.phone, status: 'pending', direction: 'outbound-api')

    if @message.save
      redirect_to conversation_messages_path(@conversation), notice: 'Message sent!'
    else
      redirect_to conversation_messages_path(@conversation), notice: 'Something went wrong. Please try again'
    end
  end

  def reply
    # handle Twilio POST here
  end

  private


    def message_params
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
