class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :website
      t.string :logo
      t.string :broker_mc
      t.string :carrier_mc
      t.string :us_dot
      t.integer :company_manager_id
      t.string :company_type
      t.boolean :has_broker_mc, default: false
      t.boolean :has_carrier_mc, default: false
      t.date :date_formed
      t.timestamps
    end
  end
end
