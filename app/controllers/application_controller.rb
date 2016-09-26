class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:shipment_user, :driver_user, :office_user] 
  devise_group :office, contains: [:office_user]
  devise_group :shipper, contains: [:shipment_user]  
  devise_group :driver, contains: [:driver_user]   
end
