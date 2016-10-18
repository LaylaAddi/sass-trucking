class CreateDriverStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :driver_statements do |t|
      t.decimal :insurance1
      t.string :insurance2_integer
      t.decimal :trailer_rent
      t.decimal :truck_rent
      t.string :notes
      t.integer :driver_user_id, index: true
      t.timestamps
    end
  end
end
