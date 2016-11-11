class CreateMiles < ActiveRecord::Migration[5.0]
  def change
    create_table :miles do |t|
      t.integer :mileage
      t.string :type
      t.string :notes
      t.integer :trailer_id, index: true
      t.integer :truck_id, index: true
      t.timestamps
    end
  end
end
