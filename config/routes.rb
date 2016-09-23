Rails.application.routes.draw do
  
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
  get 'creatives/carrier_package', to: 'creatives#download_carrier'
end
