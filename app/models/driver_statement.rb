class DriverStatement < ApplicationRecord
  has_many :loads
  has_many :driver_users, through: :loads
  belongs_to :driver_user
end
