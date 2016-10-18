class DriverUser < User
  has_many :loads
  has_many :hrc_users, through: :loads
  has_many :load_payment_categories
  has_many :driver_statements, through: :load_payment_categories
end