class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:shipment_user, :driver_user, :dispatch_user] 
  devise_group :dispatch, contains: [:dispatch_user]
  devise_group :shipper, contains: [:shipment_user]  
  devise_group :driver, contains: [:driver_user]   
end
