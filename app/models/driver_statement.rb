class DriverStatement < ApplicationRecord
  has_many :loads, dependent: :nullify 
  has_many :driver_users, through: :loads
  belongs_to :driver_user
  validates_presence_of :payment_status, :due_date
  validates_presence_of :load_ids, on: :create  
end
