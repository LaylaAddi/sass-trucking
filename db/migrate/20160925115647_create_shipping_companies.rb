class CreateShippingCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_companies do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :telephone
      t.string :website
      t.string :logo
      t.string :broker_mc
      t.string :carrier_mc
      t.string :us_dot
      t.integer :shipper_id

      t.timestamps
    end
  end
end
