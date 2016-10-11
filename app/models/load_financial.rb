class LoadFinancial < ApplicationRecord
  belongs_to :load
  before_create :set_rate, :set_miles, :set_percent
  
  def set_rate
    self.gross_rate = load.rate
  end
  
  def set_miles
    self.miles = load.distance
  end
  
  def set_percent
    self.percent_deducted = load.load_percent
  end
end
