class Conversations::TextMessagesController < ApplicationController

  before_action :set_conversation, except: [:reply]
  skip_before_action :verify_authenticity_token, only: [:reply] 

  def index
    @messages = @conversation.text_messages.order("created_at ASC")
    @message = @conversation.text_messages.build
  end

  def create
    @message = @conversation.text_messages.build(message_params)

    # Set the fields to the proper values since the only thing sent is the body
    @message.update(to: @conversation.person.phone, status: 'pending', direction: 'outbound-api')

    if @message.save
      SendSmsJob.perform_later(@message)
      redirect_to conversation_text_messages_path(@conversation), notice: 'Message sent!'
    else
      redirect_to conversation_text_messages_path(@conversation), notice: 'Something went wrong. Please try again'
    end
  end

  def reply
    # handle Twilio POST here
    from = params[:From].gsub(/^\+\d/, '')
    body = params[:Body]
    status = params[:SmsStatus]
    direction = 'inbound'
    message_sid = params[:MessageSid]

    # Find the conversation it should belong to.
    person = Person.where("phone like ?", "%#{from}%").first
    @conversation = Conversation.where(person: person).first
    @conversation.messages.build(body: body, direction: direction, status: status, from: from, message_sid: message_sid).save
    # the head :ok tells everything is ok
    # This stops the nasty template errors in the console
    head :ok, content_type: "text/html"
  end

  private
    def set_conversation
      @conversation = current_user.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:text_message).permit(:body)
    end
end