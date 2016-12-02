class TextsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'texts'
  end
end 