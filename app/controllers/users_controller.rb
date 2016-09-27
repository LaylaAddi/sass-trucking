class UsersController < ApplicationController
  
  def dashboard
    @company_manager = current_company_manager
    @company_user = current_company_user
    @app_user = current_app_user
    @user = current_user
  end
end