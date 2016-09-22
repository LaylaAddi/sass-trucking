Rails.application.routes.draw do
  root to: 'creatives#index' 
  get 'pages/index', to: 'pages#index'
end
