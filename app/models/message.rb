class Message < ApplicationRecord
  scope :for_number,        -> (number) { where(number: number).by_date }
  scope :by_date,           -> { order(created_at: :desc) }
  scope :recent_by_number,  -> { group(:number).having('created_at = MAX(created_at)') }

  validates_presence_of :text
    
  
    def sent_received
      if
        self.inbound == true
        return "received"
      else
        self.inbound == false
        return "sent"
    end 
  end

end
