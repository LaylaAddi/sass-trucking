class SendSmsJob < ApplicationJob

  queue_as :default

  def perform(text_message) 
    # Send the SMS now, then update the message status
    SMS.new(text_message.to).send text_message.body
    text_message.update_columns(status: "sent") 

  end

end