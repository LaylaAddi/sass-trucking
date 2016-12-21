class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations.includes(:person).all
  end
end
