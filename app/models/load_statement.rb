class LoadStatement < ApplicationRecord
  has_many :statement_loads
  has_many :loads, through: :statement_loads

end