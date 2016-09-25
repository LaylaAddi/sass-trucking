Rails.application.routes.draw do
  
  devise_for :dispatch_users, :controllers => { registrations: 'dispatch_users/registrations' }
  resources :dispatch_users
  devise_for :driver_users, :controllers => { registrations: 'driver_users/registrations' }
  resources :driver_users  
  devise_for :shipper_users, :controllers => { registrations: 'shipper_users/registrations' } 
  resources :shipper_users
  
  resources :users
  
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
  get 'creatives/carrier_package', to: 'creatives#download_carrier'
end
