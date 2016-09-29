class AddTable < ActiveRecord::Migration[5.0]
  def change
    create_table :operating_authorities do |t|
      t.string :entity_type
      t.string :type
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
      t.string :drivers
      t.string :mcs_150_form_date	 	
      t.string :mcs_150_mileage_year	 
      t.integer :company_id

      t.timestamps
    end
    
  
  end
end
