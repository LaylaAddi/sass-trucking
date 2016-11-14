class AddTable < ActiveRecord::Migration[5.0]
  def change
    
    create_table :company_profiles do |t|
      t.string :company_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip  
      t.string :telephone
      t.string :fax
      t.string :website
      t.string :logo
      t.string :broker_mc_number
      t.string :carrier_mc_number
      t.string :us_dot_number
      t.string :updated_by
      t.string :contact
      t.string :email 

      t.timestamps
    end
    
 create_table :loads do |t|
      t.string :commodity
      t.string :weight
      t.string :units
      t.string :load_size
      t.integer :miles
      t.decimal :invoice_price
      t.decimal :booking_fee
      t.decimal :rate_told_to_driver 
      t.decimal :percent_deducted      
      t.decimal :total_hrc_expenses
      t.decimal :rate_to_driver
      t.decimal :rate_after_percent
      t.decimal :rate_after_booking_fee 
      t.date :pick_up_date
      t.time :pick_up_time
      t.string :pick_up_time_notes
      t.string :pick_up_notes
      t.date :delivery_date
      t.time :delivery_time
      t.string :delivery_time_notes 
      t.string :delivery_notes      
      t.string :equipment_type
      t.string :status_name 
      t.integer :hrc_user_id, index: true
      t.integer :driver_user_id, index: true
      t.integer :company_profile_id, index: true       
      t.string :updated_by
      t.string :special_instructions
      t.string :dimentions
      t.string :origin_street
      t.string :origin_city  
      t.string :origin_state
      t.string :origin_zip
      t.string :origin_phone
      t.string :origin_contact      
      t.float :origin_latitude
      t.float :origin_longitude
      t.string :destination_street
      t.string :destination_city  
      t.string :destination_state
      t.string :destination_zip
      t.string :destination_phone 
      t.string :destination_contact        
      t.float :destination_latitude
      t.float :destination_longitude 
      t.string :consignor_name
      t.string :consignee_name 
      t.integer :driver_statement_id, index: true
      t.decimal :rate_to_driver_after_factor_fees

      t.timestamps
    end
    
    create_table :load_addresses do |t|
      t.string :address_type
      t.string :street
      t.float :latitude
      t.float :longitude
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :company
      t.string :contact
      t.string :phone
      t.string :notes
      t.integer :load_id, index: true   

      t.timestamps
    end
    
    create_table :transactions do |t|
      t.string :expense_type
      t.decimal :debit, default: 0.00
      t.decimal :credit, default: 0.00
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :zip 
      t.float :latitude
      t.float :longitude
      t.integer :transactionable_id
      t.string  :transactionable_type
      t.string :business_name

      t.timestamps
    end
    
    create_table :company_profile_memberships do |t|
      t.integer :company_profile_id, index: true
      t.integer :user_id, index: true
      t.string :membership_type
      t.index [:user_id, :company_profile_id], name: 'user_company_profile'

      t.timestamps
    end


    
    create_table :vendor_profiles do |t|
      t.string :company_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :telephone
      t.string :fax
      t.string :website
      t.string :logo
      t.string :contact_name
      t.string :email
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
    
    create_table :load_documents do |t|
      t.string :doc_file
      t.string :file_type
      t.string :note
      t.integer :load_id, index: true

      t.timestamps
      
    end
    
    create_table :trucks do |t|
      t.boolean :belongs_to_hrc, default: false
      t.string :year
      t.string :make
      t.string :model
      t.string :color
      t.string :number
      t.string :vin
      t.string :image
      t.string :notes
      t.string :service_status
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :zip 
      t.float :latitude
      t.float :longitude
      t.integer :driver_user_id, index: true


      t.timestamps
    end  
    
    create_table :trailers do |t|
      t.string :year
      t.string :make
      t.string :model
      t.string :color
      t.string :number
      t.string :service_status
      t.string :vin
      t.string :image
      t.string :notes
      t.integer :driver_user_id, index: true
      t.string :length
      t.string :door_type
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :zip 
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    
    create_table :driver_statements do |t|
      t.string :notes
      t.integer :driver_user_id 
      t.string :payment_status
      t.date :due_date
      t.decimal :insurance_payment, default: 0
      t.decimal :trailer_rental, default: 0
      t.decimal :truck_rental, default: 0
      t.decimal :other, default: 0
      t.string :payment_notes
      t.timestamps
    end
    
    create_table :miles do |t|
      t.integer :mileage
      t.string :type
      t.string :notes

      t.integer :trailer_id, index: true
      t.integer :truck_id, index: true
      t.timestamps
    end
    
    create_table :truck_images do |t|
      t.string :notes
      t.string :image_file
      t.integer :truck_id, index: true
      t.timestamps
    end
    
    create_table :trailer_images do |t|
      t.string :notes
      t.string :image_file
      t.integer :trailer_id, index: true
      t.timestamps
    end
    
    
  end
  
  
end
