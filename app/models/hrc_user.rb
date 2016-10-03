class HrcUser < User
  has_many :loads
  has_many :driver_users, through: :loads
end