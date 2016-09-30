class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :website
      t.string :logo
      t.string :broker_mc_number
      t.string :carrier_mc_number
      t.string :us_dot_number
      t.string :company_type
      t.boolean :show_add_mc, default: true
      t.date :date_formed
      t.integer :company_manager_id
      t.timestamps
    end
  end
end
