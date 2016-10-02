class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :location
      t.string :telephone
      t.string :website
      t.string :logo
      t.string :broker_mc_number
      t.string :carrier_mc_number
      t.string :us_dot_number
      t.string :updated_by
      t.string :contact
      t.string :profile_image      
      t.timestamps
    end
  end
end
