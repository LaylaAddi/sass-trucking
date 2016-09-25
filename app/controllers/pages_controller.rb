class PagesController < ApplicationController

  before_action :authenticate_user! # Ensure someone is logged in
  
  
  def index
  end
end
