Rails.application.routes.draw do
  resources :shippers
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
end
