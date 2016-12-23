class CreateDriverCheckins < ActiveRecord::Migration[5.0]
  def change
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
