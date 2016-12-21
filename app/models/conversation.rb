class Conversation < ApplicationRecord
  belongs_to :driver_user
  belongs_to :hrc_user
end
