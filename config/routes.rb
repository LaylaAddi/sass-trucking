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

  
  
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
  get 'creatives/carrier_package', to: 'creatives#download_carrier'
end
