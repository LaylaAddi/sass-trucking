class CreateShippers < ActiveRecord::Migration[5.0]
  def change
    create_table :shippers do |t|
      t.string :name
      t.string :handle
      t.string :contact_person
      t.string :telephone
      t.string :fax
      t.string :location
      t.string :broker_mc
      t.string :carrier_mc
      t.string :dot_number
      t.string :website
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :notes

      t.timestamps
    end
  end
end
