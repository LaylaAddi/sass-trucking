class Conversation < ApplicationRecord
  belongs_to :person
  belongs_to :user
  has_many :text_messages 
end
