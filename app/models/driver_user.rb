class DriverUser < User
  has_many :loads
  has_many :hrc_users, through: :loads
  has_many :statements
end