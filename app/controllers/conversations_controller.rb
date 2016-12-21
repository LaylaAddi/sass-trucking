class ConversationsController < ApplicationController
  def index
    @driver_user = DriverUser.find(params[:driver_user_id])
    @conversations = @driver_user.conversations 
    #@conversation = Conversation.find(params[:conversation_id])
    #@conversations = Conversation.all

  end
end


#   def index
#     @conversations = current_user.conversations.includes(:person).all
#   end


