class DriverStatement < Statement
  belongs_to :driver_user
  # has_many :statement_statuses
  # has_many :loads, through: :statement_statuses
  # accepts_nested_attributes_for :statement_statuses 
  has_many :loads
  accepts_nested_attributes_for :loads 
end