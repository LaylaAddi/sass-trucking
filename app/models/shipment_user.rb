class ShipmentUser < User
  
  ransack_alias :rs_user, :first_name_or_last_name_or_city_or_state 
  belongs_to :shipping_company
  ransack_alias :rs_user, :first_name_or_last_name_or_city_or_state  
end