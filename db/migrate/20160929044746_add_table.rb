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
      t.decimal :agent_fee, default: 0.00 
      t.date :pick_up_date
      t.time :pick_up_time
      t.string :broker_shipper_load_id
      t.string :pick_up_notes
      t.date :delivery_date
      t.time :delivery_time
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
    
    create_table :addresses do |t|
      t.string :type
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
      t.string :pick_up_delivery
      t.integer :miles
      t.integer :order, index: true
      t.integer :load_id, index: true   
      t.integer :trailer_id, index: true 
      t.integer :truck_id, index: true 
      t.integer :driver_checkin_id, index: true 
      t.integer :driver_user_id, index: true 
      t.integer :hrc_user_id, index: true  
      
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
      t.string :type
      t.string :entity_type
      t.string :operating_status
      t.string :out_of_service_date
      t.string :legal_name
      t.string :dba_name
      t.string :physical_address
      t.string :phone
      t.string :mailing_address
      t.string :usdot_number
      t.string :state_carrier_id_number	 
      t.string :mc_mx_ff_numbers
      t.string :duns_number
      t.string :power_units 	
      t.string :driver_count	
      t.string :mcs_150_form_date
      t.string :mcs_150_mileage_year
      t.string :general_freight
      t.string :household_goods
      t.string :metal_sheets_coils_rolls
      t.string :motor_vehicles
      t.string :drivetow_away
      t.string :logs_poles_beams_lumber
      t.string :building_materials
      t.string :mobile_homes
      t.string :machinery_large_objects
      t.string :fresh_produce
      t.string :safer_layout
      t.string :liquids_gases
      t.string :intermodal 
      t.string :passengers
      t.string :oilfield_equipment
      t.string :livestock
      t.string :grain_feed_hay
      t.string :coal_coke
      t.string :meat
      t.string :garbage_refuse
      t.string :us_mail
      t.string :chemicals
      t.string :commodities_dry_bulk
      t.string :refrigerated_food
      t.string :beverages
      t.string :paper_products
      t.string :utilities
      t.string :agricultural_farm_supplies
      t.string :construction
      t.string :water_well
      t.string :driver_inspections_count
      t.string :vehicle_inspections_count
      t.string :hazmat_inspections_count
      t.string :iep_inspections_count
      t.string :driver_inspections_out_service
      t.string :vehicle_inspections_out_service
      t.string :hazmat_inspections_out_service
      t.string :iep_inspections_out_service
      t.string :driver_inspections_out_service_percent
      t.string :vehicle_inspections_out_service_percent
      t.string :hazmat_inspections_out_service_percent
      t.string :iep_inspections_out_service_percent
      t.string :crash_fatal
      t.string :crash_injury
      t.string :crash_tow
      t.string :crash_total
      t.string :cad_vehicle_inspections
      t.string :cad_driver_inspections
      t.string :cad_vehicle_out_of_service
      t.string :cad_driver_out_of_service
      t.string :cad_vehicle_out_of_service_percent
      t.string :cad_driver_out_of_service_percent
      t.string :us_inspections_prev_24
      t.string :cad_inspections_prev_24
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
      t.string :plate
      t.string :plate_state
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
      t.string :length
      t.string :door_type
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :zip 
      t.float :latitude
      t.float :longitude
      t.string :plate
      t.string :plate_state
      t.integer :driver_user_id, index: true
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
    
    create_table :messages do |t|
      t.string :number
      t.string :text
      t.boolean :inbound
      t.string :user 
      t.float :latitude
      t.float :longitude
      t.string :to_country
      t.string :to_state
      t.string :to_city
      t.string :to_zip
      t.string :from_country
      t.string :from_state
      t.string :from_city
      t.string :from_zip
      t.string :sms_message_sid
      t.string :num_media
      t.string :sms_sid 
      t.integer :hrc_user_id, index: true
      t.integer :driver_user_id, index: true

      t.timestamps
    end
    
    

    create_table :driver_checkins do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude      
      t.float :longitude 
      t.string :status
      t.string :notes
      t.string :ip_address
      t.integer :driver_user_id, index: true 

      t.timestamps
    end

  end
end
