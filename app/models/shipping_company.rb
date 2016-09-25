class ShippingCompany < ApplicationRecord
  has_many :shipment_users
end
