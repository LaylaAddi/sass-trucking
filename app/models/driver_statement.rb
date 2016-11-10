class DriverStatement < ApplicationRecord
  has_many :loads
  has_many :driver_users, through: :loads
  belongs_to :driver_user
  validates_presence_of :payment_status 
end
