Rails.application.routes.draw do
  
  # devise_for :managers, :controllers => { registrations: 'registrations/dispatchers' }
  devise_for :office_users, :controllers => { registrations: 'office_users/registrations' }
  resources :office_users
  devise_for :driver_users, :controllers => { registrations: 'driver_users/registrations' }
  resources :driver_users  
  devise_for :shipment_users, :controllers => { registrations: 'shipment_users/registrations' } 
  resources :shipment_users 
  
  resources :users
  resources :shipping_companies
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
  get 'creatives/carrier_package', to: 'creatives#download_carrier'
  get 'shipper/dashboard', to: 'shipper_users#dashboard'
end
