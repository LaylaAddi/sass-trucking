Rails.application.routes.draw do








  get 'messages/reply'

  devise_for :hrc_users, 
  :controllers => { registrations: 'hrc_users_registrations/registrations'} 
  resources :hrc_users do
    collection {post :import}
  end
  
  devise_for :shipper_users, 
  :controllers => { registrations: 'shipper_users_registrations/registrations'}
  resources :shipper_users do
    collection {post :import}
  end
  
  devise_for :driver_users, 
  :controllers => { registrations: 'driver_users_registrations/registrations'}
  
  resources :driver_users do
    collection {post :import}
      resources :driver_statements
  end 
  
  resources :users do
    collection {post :import}
  end 
  
  resources :trucks do
    resources :truck_images
      resources :truck_miles
        collection {post :import}
  end
  
  resources :trailers do
    resources :trailer_images
      resources :trailer_miles
        collection {post :import}
  end
 
  resources :company_profiles do
    collection {post :import}
      resources :mcs 
        resources :carrier_mcs 
          resources :broker_mcs 
            resources :us_dots
              resources :company_profile_memberships
  end
  

    
  resources :loads do
    collection {post :import}
      resources :load_documents, only: [:new, :create, :update] 
        resources :transactions
          resources :load_addresses
  end 
  
  resources :load_documents
  
  resources :vendor_profiles do
    collection {post :import}
  end   

  resources :miles

  resource :messages do
    collection do
      post 'reply'
    end
  end

  get 'hrc_dashboard', to: 'hrc_users#hrc_dashboard'
  get 'driver_dashboard', to: '_driver_users#driver_dashboard'
  get 'shipper_dashboard', to: 'shipper_users#shipper_dashboard'
  
  root to: 'creatives#index' 

  get 'pages/index', to: 'pages#index'
  
  get 'creatives/carrier_package', to: 'creatives#download_carrier'


end
