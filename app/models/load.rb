class Load < ApplicationRecord

  belongs_to :hrc_user 
  belongs_to :driver_user, optional: true   
  has_many :load_addresses, dependent: :destroy 
  
end
