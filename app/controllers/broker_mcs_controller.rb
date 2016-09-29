class BrokerMcsController < ApplicationController
  
  def new 
    @company = Company.find(params[:company_id])
    @broker_mc = BrokerMcs.new 
  end
  
  def create
    @company = Company.find(params[:company_id])
    @broker_mc = @company.broker_mcs.build(bmc_params)
    
    # if @broker_mc.save
    #   flash[:success] = "Your #{@broker_mc.authority_type} with number #{@broker_mc.number} has been saved"
    #   redirect_to @company
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :new
    # end
  end
  
  def edit
    @company = Company.find(params[:company_id])
    @broker_mc = BrokerMc.find(params[:id]) 
    
    require 'capybara/poltergeist'
    session = Capybara::Session.new(:poltergeist)
    session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
    session.choose('2')
    session.fill_in('4', with: @name)
    session.find('input[type="SUBMIT"]').click
    
    

    entity_type = session.all('.queryfield')[0]
    operating_status = session.all('.queryfield')[1]	
    out_of_service_date = session.all('.queryfield')[2]
    legal_name = session.all('.queryfield')[3]
    dba_name = session.all('.queryfield')[4] 
    physical_address = session.all('.queryfield')[5]
    phone = session.all('.queryfield')[6]
    mailing_address = session.all('.queryfield')[7]
    usdot_number = session.all('.queryfield')[8] 	
    state_carrier_id_number = session.all('.queryfield')[9] 
    mc_mx_ff_numbers = session.all('.queryfield')[10]	
    duns_number = session.all('.queryfield')[11]
    power_units = session.all('.queryfield')[12]
    drivers = session.all('.queryfield')[13]
    mcs_150_form_date = session.all('.queryfield')[14]
    mcs_150_mileage_year = session.all('.queryfield')[15]
    address = session.all('.queryfield')[16]  
    telephone = session.all('.queryfield')[17] 
      
    
    @company = Company.find(params[:company_id])
    @broker_mc = BrokerMc.find(params[:id]) 
    if @broker_mc.update(
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
      flash[:success] = "Your #{@broker_mc.entity_type} with number #{@broker_mc.mc_mx_ff_numbers} has been updated and has an operating status of #{@broker_mc.operating_status}."
      render :edit
    else
      flash[:danger] = "There was a problem saving your Authority"
      render :edit
    end
  end
  
  def update
    # @company = Company.find(params[:company_id])
    # @operating_authority = OperatingAuthority.find(params[:id]) 
    # if @operating_authority.update(bmc_params)
    #   flash[:success] = "Your #{@operating_authority.authority_type} with number #{@operating_authority.number} has been updated"
    #   redirect_to @company
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :edit
    # end
    
    
  end
  

  
  private
  
  def bmc_params
    params.require(:broker_mc).permit(
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

  