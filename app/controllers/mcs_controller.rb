class McsController < ApplicationController
  

  def new 
    @company = Company.find(params[:company_id])
    @mc = Mc.new 
  end
  
  def create
    @company = Company.find(params[:company_id])
    @mc = @company.operating_authorities.build(oa_params)
    
    if @mc.save
      flash[:success] = "Your #{@mc.authority_type} with number #{@mc.number} has been saved"
      redirect_to @company
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :new
    end
  end
  
  def edit
    @company = Company.find(params[:company_id])
    @mc = Mc.find(params[:id]) 
    
    require 'capybara/poltergeist'
    session = Capybara::Session.new(:poltergeist)
    session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
    session.choose('2')
    session.fill_in('4', with: @company.broker_mc)
    session.find('input[type="SUBMIT"]').click
    
    
    name = session.current_url
    address = session.all('.queryfield')[0].text  
    telephone = session.all('.queryfield')[1].text 
      
    
    @company = Company.find(params[:company_id])
    @mc = Mc.find(params[:id]) 
    if @mc.update(name: name, address: address, telephone: telephone)
      flash[:success] = "Your #{@mc.authority_type} with number #{@mc.number} has been updated"
      redirect_to @company
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :edit
    end
  end
  

 

  
  
  


end
