class CreateLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :loads do |t|
      t.string :name 
      t.string :commodity
      t.string :weight
      t.string :units
      t.string :load_size
      t.decimal :rate
      t.decimal :percent_deducted      
      t.integer :miles
      t.decimal :total_hrc_expenses
      t.decimal :rate_to_driver
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
      t.string :type
      t.integer :load_statement_id, index: true  

      t.timestamps
    end
  end
end


