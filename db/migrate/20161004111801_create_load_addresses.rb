class CreateLoadAddresses < ActiveRecord::Migration[5.0]
  def change
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
  end
end
