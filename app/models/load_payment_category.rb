class LoadPaymentCategory < ApplicationRecord
  belongs_to :load
  belongs_to :driver_statement
end
  