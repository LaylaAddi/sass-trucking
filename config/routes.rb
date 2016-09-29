Rails.application.routes.draw do
  
   

  devise_for :app_users, 
  :controllers => { registrations: 'app_users_registrations/registrations'} 
  resources :app_users
  
  devise_for :company_users, 
  :controllers => { registrations: 'company_users_registrations/registrations'}
  resources :company_users
  
  devise_for :company_managers, 
  :controllers => { registrations: 'company_managers_registrations/registrations'}
  resources :company_managers
  
  resources :companies do
    resources :broker_mcs 
    resources :carrier_mcs     
  end
  
  get 'dashboard', to: 'users#dashboard'
  
  root to: 'creatives#index' 
  
  get 'pages/index', to: 'pages#index'
  
  get 'creatives/carrier_package', to: 'creatives#download_carrier'
  
  get 'authorty', to: 'operating_authorities#scrape'
  
end
