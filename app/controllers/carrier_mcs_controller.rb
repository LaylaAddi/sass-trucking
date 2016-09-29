class CarrierMcsController < ApplicationController
  
  def new 
    @company = Company.find(params[:company_id])
    @carrier_mc = CarrierMcs.new 
  end
  
  def create
    @company = Company.find(params[:company_id])
    @carrier_mc = @company.carrier_mcs.build(cmc_params)
    
    # if @carrier_mc.save
    #   flash[:success] = "Your #{@carrier_mc.authority_type} with number #{@carrier_mc.number} has been saved"
    #   redirect_to @company
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :new
    # end
  end
  
  def edit
    @company = Company.find(params[:company_id])
    @carrier_mc = CarrierMcs.find(params[:id]) 
    
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
    @carrier_mc = CarrierMcs.find(params[:id]) 
    if @carrier_mc.update(
                          entity_type: entity_type,
                          operating_status: operating_status,
                          out_of_service_date: out_of_service_date,
                          legal_name: legal_name,
                          dba_name: dba_name,
                          physical_address: physical_address,
                          phone: phone,
                          mailing_address: mailing_address,
                          usdot_number: usdot_number,
                          state_carrier_id_number: state_carrier_id_number,
                          mc_mx_ff_numbers: mc_mx_ff_numbers,
                          duns_number: duns_number,
                          power_units: power_units,
                          drivers: drivers,
                          mcs_150_form_date: mcs_150_form_date,
                          mcs_150_mileage_year: mcs_150_mileage_year
                        )
      flash[:success] = "Your #{@carrier_mc.entity_type} with number #{@carrier_mc.mc_mx_ff_numbers} has been updated and has an operating status of #{@carrier_mc.operating_status}."
      render :edit
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :edit
    end
  end
  
  def update
    # @company = Company.find(params[:company_id])
    # @operating_authority = OperatingAuthority.find(params[:id]) 
    # if @operating_authority.update(cmc_params)
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
  
  def cmc_params
    params.require(:carrier_mc).permit(
                                      :type,
                                      :entity_type,
                                      :operating_status,	
                                      :out_of_service_date,
                                      :legal_name,
                                      :dba_name, 
                                      :physical_address,
                                      :phone,
                                      :mailing_address,
                                      :usdot_number, 	
                                      :state_carrier_id_number, 
                                      :mc_mx_ff_numbers,	
                                      :duns_number,
                                      :power_units,
                                      :drivers,
                                      :mcs_150_form_date,
                                      :mcs_150_mileage_year,  
                                      :company_id
                                      )
  end
end

  