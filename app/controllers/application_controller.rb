class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:hrc_user, :shipper_user, :driver_user]  
  before_action :authenticate_user!

  
end
