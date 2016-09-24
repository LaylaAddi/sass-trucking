Rails.application.routes.draw do
  
  devise_for :dispatch_users, :controllers => { registrations: 'dispatch_users/registrations' }
  devise_for :driver_users, :controllers => { registrations: 'driver_users/registrations' }
  devise_for :shipper_users, :controllers => { registrations: 'shipper_users/registrations' }  
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
  get 'creatives/carrier_package', to: 'creatives#download_carrier'
end
