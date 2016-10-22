class AddTable < ActiveRecord::Migration[5.0]
  def change
    
    create_table :statement_loads do |t|  
      t.integer :load_id, index: true
      t.integer :load_statement_id, index: true
      t.index [:load_id, :load_statement_id], name: 'load_id_load_statement_id_index'
      t.timestamps
    end

    create_table :mcs do |t|
      t.string :type, null: false, default: ""
      t.string :entity_type, null: false, default: ""
      t.string :operating_status, null: false, default: ""
      t.string :out_of_service_date, null: false, default: ""
      t.string :legal_name, null: false, default: ""
      t.string :dba_name, null: false, default: ""
      t.string :physical_address, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :mailing_address, null: false, default: ""
      t.string :usdot_number, null: false, default: ""
      t.string :state_carrier_id_number, null: false, default: ""	 
      t.string :mc_mx_ff_numbers, null: false, default: ""
      t.string :duns_number, null: false, default: ""
      t.string :power_units, null: false, default: "" 	
      t.string :driver_count	, null: false, default: ""
      t.string :mcs_150_form_date, null: false, default: ""
      t.string :mcs_150_mileage_year, null: false, default: ""
      t.string :general_freight, null: false, default: ""
      t.string :household_goods, null: false, default: ""
      t.string :metal_sheets_coils_rolls, null: false, default: ""
      t.string :motor_vehicles, null: false, default: ""
      t.string :drivetow_away, null: false, default: ""
      t.string :logs_poles_beams_lumber, null: false, default: ""
      t.string :building_materials, null: false, default: ""
      t.string :mobile_homes, null: false, default: ""
      t.string :machinery_large_objects, null: false, default: ""
      t.string :fresh_produce, null: false, default: ""
      t.string :safer_layout, null: false, default: ""
      t.string :liquids_gases, null: false, default: ""
      t.string :intermodal, null: false, default: "" 
      t.string :passengers, null: false, default: ""
      t.string :oilfield_equipment, null: false, default: ""
      t.string :livestock, null: false, default: ""
      t.string :grain_feed_hay, null: false, default: ""
      t.string :coal_coke, null: false, default: ""
      t.string :meat, null: false, default: ""
      t.string :garbage_refuse, null: false, default: ""
      t.string :us_mail, null: false, default: ""
      t.string :chemicals, null: false, default: ""
      t.string :commodities_dry_bulk, null: false, default: ""
      t.string :refrigerated_food, null: false, default: ""
      t.string :beverages, null: false, default: ""
      t.string :paper_products, null: false, default: ""
      t.string :utilities, null: false, default: ""
      t.string :agricultural_farm_supplies, null: false, default: ""
      t.string :construction, null: false, default: ""
      t.string :water_well, null: false, default: ""
      t.string :driver_inspections_count, null: false, default: ""
      t.string :vehicle_inspections_count, null: false, default: ""
      t.string :hazmat_inspections_count, null: false, default: ""
      t.string :iep_inspections_count, null: false, default: ""
      t.string :driver_inspections_out_service, null: false, default: ""
      t.string :vehicle_inspections_out_service, null: false, default: ""
      t.string :hazmat_inspections_out_service, null: false, default: ""
      t.string :iep_inspections_out_service, null: false, default: ""
      t.string :driver_inspections_out_service_percent, null: false, default: ""
      t.string :vehicle_inspections_out_service_percent, null: false, default: ""
      t.string :hazmat_inspections_out_service_percent, null: false, default: ""
      t.string :iep_inspections_out_service_percent, null: false, default: ""
      t.string :crash_fatal, null: false, default: ""
      t.string :crash_injury, null: false, default: ""
      t.string :crash_tow, null: false, default: ""
      t.string :crash_total, null: false, default: ""
      t.string :cad_vehicle_inspections, null: false, default: ""
      t.string :cad_driver_inspections, null: false, default: ""
      t.string :cad_vehicle_out_of_service, null: false, default: ""
      t.string :cad_driver_out_of_service, null: false, default: ""
      t.string :cad_vehicle_out_of_service_percent, null: false, default: ""
      t.string :cad_driver_out_of_service_percent, null: false, default: ""
      t.string :us_inspections_prev_24, null: false, default: ""
      t.string :cad_inspections_prev_24, null: false, default: ""
      
      t.string :crash_results_24_prior 
      t.string :cad_crash_results_24_prior 
      t.string :cad_crash_fatal 
      t.string :cad_crash_injury 
      t.string :cad_crash_tow  
      t.string :cad_crash_total 
      t.string :us_inspection_results_for_24_months_prior_to
      t.string :total_inspections
      t.string :total_iep_inspections
      t.string :crash_inspections
      t.string :the_rating_below_is_current_as_of
      t.string :rating_date 
      t.string :review_date 
      t.string :review_rating
      t.string :review_type
      t.string :company_profile_id, index: true     


      t.timestamps
    end
    
  
  end
end
