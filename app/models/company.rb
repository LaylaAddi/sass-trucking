class Company < ApplicationRecord
  has_many :operating_authorities, dependent: :destroy
end

     