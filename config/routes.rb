Rails.application.routes.draw do

  devise_for :hrc_users, 
  :controllers => { registrations: 'hrc_users_registrations/registrations'} 
  resources :hrc_users
  
  devise_for :shipper_users, 
  :controllers => { registrations: 'shipper_users_registrations/registrations'}
  resources :shipper_users
  
  devise_for :driver_users, 
  :controllers => { registrations: 'driver_users_registrations/registrations'}
  resources :driver_users
  
  resources :users
  
  resources :company_profiles do
    resources :mcs 
      resources :carrier_mcs 
        resources :broker_mcs 
          resources :us_dots
  end
  
    
  resources :loads do
    resources :load_expenses
      resources :load_addresses
  end 
  
  get 'dashboard', to: 'users#dashboard'
  
  root to: 'creatives#index' 
  
  get 'pages/index', to: 'pages#index'
  
  get 'creatives/carrier_package', to: 'creatives#download_carrier'

end
