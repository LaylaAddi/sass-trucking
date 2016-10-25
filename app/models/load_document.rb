class LoadDocument < ApplicationRecord
  belongs_to :load 
  validates :file, :file_type, presence: true
end
