class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:company_user, :company_manager, :app_user] 
  before_action :authenticate_user!

  
end
