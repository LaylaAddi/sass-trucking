class CreateLoadStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :load_statements do |t|
      t.decimal :trailer_rent
      t.decimal :truck_rent
      t.decimal :insurance
      t.string :notes

      t.timestamps
    end
  end
end
