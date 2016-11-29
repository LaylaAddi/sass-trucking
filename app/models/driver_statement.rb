class DriverStatement < ApplicationRecord
  has_many :loads, dependent: :nullify 
  has_many :driver_users, through: :loads
  belongs_to :driver_user
  validates_presence_of :payment_status, :due_date, :insurance_payment, :trailer_rental, :truck_rental, :other
  validates_presence_of :load_ids, on: :create  
end
