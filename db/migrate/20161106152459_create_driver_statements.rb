class CreateDriverStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :driver_statements do |t|
      t.string :notes
      t.integer :driver_user_id 
      t.timestamps
    end
  end
end
