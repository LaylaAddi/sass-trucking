class OperatingAuthoritiesController < ApplicationController
  
  def new 
    @company = Company.find(params[:company_id])
    @operating_authority = OperatingAuthority.new 
  end
  
  def create
    @company = Company.find(params[:company_id])
    @operating_authority = @company.operating_authorities.build(oa_params)
    
    if @operating_authority.save
      flash[:success] = "Your #{@operating_authority.authority_type} with number #{@operating_authority.number} has been saved"
      redirect_to @company
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :new
    end
  end
  
  def edit
    @company = Company.find(params[:company_id])
    @operating_authority = OperatingAuthority.find(params[:id]) 
    
    require 'capybara/poltergeist'
    session = Capybara::Session.new(:poltergeist)
    session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
    session.choose('2')
    session.fill_in('4', with: @name)
    session.find('input[type="SUBMIT"]').click
    
    
    name = session.current_url
    address = session.all('.queryfield')[0]  
    telephone = session.all('.queryfield')[1] 
      
    
    @company = Company.find(params[:company_id])
    @operating_authority = OperatingAuthority.find(params[:id]) 
    if @operating_authority.update(name: name, address: address, telephone: telephone)
      flash[:success] = "Your #{@operating_authority.authority_type} with number #{@operating_authority.number} has been updated"
      redirect_to @company
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :edit
    end
  end
  
  def update
    # @company = Company.find(params[:company_id])
    # @operating_authority = OperatingAuthority.find(params[:id]) 
    # if @operating_authority.update(oa_params)
    #   flash[:success] = "Your #{@operating_authority.authority_type} with number #{@operating_authority.number} has been updated"
    #   redirect_to @company
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :edit
    # end
    
    
  end
  
  def scrape
    
  end

  
  
  
  
  private
  
  def oa_params
    params.require(:operating_authority).permit(
      :name,
      :address,
      :telephone,
      :number,
      :authority_type,
      :company_id
      )
  end
end
