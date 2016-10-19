class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:hrc_user, :shipper_user, :driver_user] 
  devise_group :hrc_user, contains: [:hrc_user] 
  before_action :authenticate_user!

  #Makes cart available in views.
  helper_method :load_statement
  
  # Ensure cart session hash exists, if not, it creates a new one with its Value to a blank hash.
  
  def cart  
    session[:load_statement] ||= {}
  end
end
