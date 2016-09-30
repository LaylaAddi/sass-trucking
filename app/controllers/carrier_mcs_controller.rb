class CarrierMcsController < ApplicationController
  
  def show
    @company = Company.find(params[:company_id])
    @cmc = CarrierMc.find(params[:id])
  end
  
  def new 
    @company = Company.find(params[:company_id])
    @carrier_mc = CarrierMc.new 
  end
  
  def create
    @company = Company.find(params[:company_id])
    @carrier_mc = @company.carrier_mcs.build(cmc_params) 
    @carrier_mc.save
    #   flash[:success] = "Your #{@carrier_mc.authority_type} with number #{@carrier_mc.number} has been saved"
    #   redirect_to @company
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :new
    # end
  end
  
  def edit
    @company = Company.find(params[:company_id])
    @carrier_mc = CarrierMc.find(params[:id]) 
    
    require 'capybara/poltergeist'
    session = Capybara::Session.new(:poltergeist)
    session.visit('https://safer.fmcsa.dot.gov/CompanySnapshot.aspx')
    session.choose('2')
    session.fill_in('4', with: @company.carrier_mc_number)
    session.find('input[type="SUBMIT"]').click
    
    
      entity_type = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(2) > td').text
      operating_status = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(3) > td:nth-child(2)').text
      out_of_service_date = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(3) > td:nth-child(4)').text
      legal_name = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(4) > td').text
      dba_name = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(5) > td').text
      physical_address = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(6) > td').text
      phone = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(7) > td').text
      mailing_address = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(8) > td').text
      usdot_number = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(9) > td:nth-child(2)').text
      state_carrier_id_number = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(9) > td:nth-child(4)').text
      mc_mx_ff_numbers = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(9) > td:nth-child(2)').text
      duns_number = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(10) > td:nth-child(4)').text
      power_units  = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(11) > td.queryfield').text
      driver_count = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(11) > td:nth-child(4) > font > b').text
      mcs_150_form_date = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(12) > td.queryfield').text
      mcs_150_mileage_year = session.find(:css, 'body > p > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > center:nth-child(3) > table > tbody > tr:nth-child(12) > td:nth-child(4)').text 
    general_freight = session.find(:css, '').text 
    household_goods = session.find(:css, '').text 
    metal_sheets_coils_rolls = session.find(:css, '').text 
    motor_vehicles = session.find(:css, '').text 
    drivetow_away = session.find(:css, '').text 
    logs_poles_beams_lumber = session.find(:css, '').text 
    building_materials = session.find(:css, '').text 
    mobile_homes = session.find(:css, '').text 
    machinery_large_objects = session.find(:css, '').text 
    fresh_produce = session.find(:css, '').text 
    safer_layout = session.find(:css, '').text 
    liquids_gases = session.find(:css, '').text 
    intermodal = session.find(:css, '').text  
    passengers = session.find(:css, '').text 
    oilfield_equipment = session.find(:css, '').text 
    livestock = session.find(:css, '').text 
    grain_feed_hay = session.find(:css, '').text 
    coal_coke = session.find(:css, '').text 
    meat = session.find(:css, '').text 
    garbage_refuse = session.find(:css, '').text 
    us_mail = session.find(:css, '').text 
    chemicals = session.find(:css, '').text 
    commodities_dry_bulk = session.find(:css, '').text 
    refrigerated_food = session.find(:css, '').text 
    beverages = session.find(:css, '').text 
    paper_products = session.find(:css, '').text 
    utilities = session.find(:css, '').text 
    agricultural_farm_supplies = session.find(:css, '').text 
    construction = session.find(:css, '').text 
    water_well = session.find(:css, '').text 
    driver_inspections_count = session.find(:css, '').text 
    vehicle_inspections_count = session.find(:css, '').text 
    hazmat_inspections_count = session.find(:css, '').text 
    iep_inspections_count = session.find(:css, '').text 
    driver_inspections_out_service = session.find(:css, '').text 
    vehicle_inspections_out_service = session.find(:css, '').text 
    hazmat_inspections_out_service = session.find(:css, '').text 
    iep_inspections_out_service = session.find(:css, '').text 
    driver_inspections_out_service_percent = session.find(:css, '').text 
    vehicle_inspections_out_service_percent = session.find(:css, '').text 
    hazmat_inspections_out_service_percent = session.find(:css, '').text 
    iep_inspections_out_service_percent = session.find(:css, '').text 
    crash_fatal = session.find(:css, '').text 
    crash_injury = session.find(:css, '').text 
    crash_tow = session.find(:css, '').text 
    crash_total = session.find(:css, '').text 
    cad_vehicle_inspections = session.find(:css, '').text 
    cad_driver_inspections = session.find(:css, '').text 
    cad_vehicle_out_of_service = session.find(:css, '').text 
    cad_driver_out_of_service = session.find(:css, '').text 
    cad_vehicle_out_of_service_percent = session.find(:css, '').text 
    cad_driver_out_of_service_percent = session.find(:css, '').text 
    us_inspections_prev_24 = session.find(:css, '').text 
    cad_inspections_prev_24 = session.find(:css, '').text 
      
    @company = Company.find(params[:company_id])
    @carrier_mc = CarrierMc.find(params[:id]) 
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
                          driver_count: driver_count,	
                          mcs_150_form_date: mcs_150_form_date,
                          mcs_150_mileage_year: mcs_150_mileage_year,
                          general_freight: general_freight,
                          household_goods: household_goods,
                          metal_sheets_coils_rolls: metal_sheets_coils_rolls,
                          motor_vehicles: motor_vehicles,
                          drivetow_away: drivetow_away,
                          logs_poles_beams_lumber: logs_poles_beams_lumber,
                          building_materials: building_materials,
                          mobile_homes: mobile_homes,
                          machinery_large_objects: machinery_large_objects,
                          fresh_produce: fresh_produce,
                          safer_layout: safer_layout,
                          liquids_gases: liquids_gases,
                          intermodal: intermodal, 
                          passengers: passengers,
                          oilfield_equipment: oilfield_equipment,
                          livestock: livestock,
                          grain_feed_hay: grain_feed_hay,
                          coal_coke: coal_coke,
                          meat: meat,
                          garbage_refuse: garbage_refuse,
                          us_mail: us_mail,
                          chemicals: chemicals,
                          commodities_dry_bulk: commodities_dry_bulk,
                          refrigerated_food: refrigerated_food,
                          beverages: beverages,
                          paper_products: paper_products,
                          utilities: utilities,
                          agricultural_farm_supplies: agricultural_farm_supplies,
                          construction: construction,
                          water_well: water_well,
                          driver_inspections_count: driver_inspections_count,
                          vehicle_inspections_count: vehicle_inspections_count,
                          hazmat_inspections_count: hazmat_inspections_count,
                          iep_inspections_count: iep_inspections_count,
                          driver_inspections_out_service: driver_inspections_out_service,
                          vehicle_inspections_out_service: vehicle_inspections_out_service,
                          hazmat_inspections_out_service: hazmat_inspections_out_service,
                          iep_inspections_out_service: iep_inspections_out_service,
                          driver_inspections_out_service_percent: driver_inspections_out_service_percent,
                          vehicle_inspections_out_service_percent: vehicle_inspections_out_service_percent,
                          hazmat_inspections_out_service_percent: hazmat_inspections_out_service_percent,
                          iep_inspections_out_service_percent: iep_inspections_out_service_percent,
                          crash_fatal: crash_fatal,
                          crash_injury: crash_injury,
                          crash_tow: crash_tow,
                          crash_total: crash_total,
                          cad_vehicle_inspections: cad_vehicle_inspections,
                          cad_driver_inspections: cad_driver_inspections,
                          cad_vehicle_out_of_service: cad_vehicle_out_of_service,
                          cad_driver_out_of_service: cad_driver_out_of_service,
                          cad_vehicle_out_of_service_percent: cad_vehicle_out_of_service_percent,
                          cad_driver_out_of_service_percent: cad_driver_out_of_service_percent,
                          us_inspections_prev_24: us_inspections_prev_24,
                          cad_inspections_prev_24: cad_inspections_prev_24                          
                         )
                         
      flash[:success] = "Your #{@carrier_mc.entity_type} number #{@carrier_mc.mc_mx_ff_numbers} with an Operating Status of #{@carrier_mc.operating_status} has been updated."
      redirect_to company_carrier_mc_path(@carrier_mc)
    else
      flash[:danger] = "There was a problem saving your Authority"
      redirect_to company_carrier_mc_path(@carrier_mc)
    end
  end
  
  def update
    # @company = Company.find(params[:company_id])
    # @carrier_mc = Mc.find(params[:id]) 
    # if @carrier_mc.update(cmc_params)
    #   flash[:success] = "Your #{@carrier_mc.authority_type} with number #{@carrier_mc.number} has been updated"
    #   redirect_to @company
    # else
    #   flash[:danger] = "There was a problem saving your Authority"
    #   render :edit
    # end
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
                                        :driver_count,	
                                        :mcs_150_form_date,
                                        :mcs_150_mileage_year,
                                        :general_freight,
                                        :household_goods,
                                        :metal_sheets_coils_rolls,
                                        :motor_vehicles,
                                        :drivetow_away,
                                        :logs_poles_beams_lumber,
                                        :building_materials,
                                        :mobile_homes,
                                        :machinery_large_objects,
                                        :fresh_produce,
                                        :safer_layout,
                                        :liquids_gases,
                                        :intermodal, 
                                        :passengers,
                                        :oilfield_equipment,
                                        :livestock,
                                        :grain_feed_hay,
                                        :coal_coke,
                                        :meat,
                                        :garbage_refuse,
                                        :us_mail,
                                        :chemicals,
                                        :commodities_dry_bulk,
                                        :refrigerated_food,
                                        :beverages,
                                        :paper_products,
                                        :utilities,
                                        :agricultural_farm_supplies,
                                        :construction,
                                        :water_well,
                                        :driver_inspections_count,
                                        :vehicle_inspections_count,
                                        :hazmat_inspections_count,
                                        :iep_inspections_count,
                                        :driver_inspections_out_service,
                                        :vehicle_inspections_out_service,
                                        :hazmat_inspections_out_service,
                                        :iep_inspections_out_service,
                                        :driver_inspections_out_service_percent,
                                        :vehicle_inspections_out_service_percent,
                                        :hazmat_inspections_out_service_percent,
                                        :iep_inspections_out_service_percent,
                                        :crash_fatal,
                                        :crash_injury,
                                        :crash_tow,
                                        :crash_total,
                                        :cad_vehicle_inspections,
                                        :cad_driver_inspections,
                                        :cad_vehicle_out_of_service,
                                        :cad_driver_out_of_service,
                                        :cad_vehicle_out_of_service_percent,
                                        :cad_driver_out_of_service_percent,
                                        :us_inspections_prev_24,
                                        :cad_inspections_prev_24,
                                        :company_id 
                                       )
  end
end

