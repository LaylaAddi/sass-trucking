class CreateLoadExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :load_expenses do |t|
      t.string :expense_type
      t.float :latitude
      t.float :longitude
      t.decimal :amount
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :business_name
      t.integer :load_id
      t.integer :vendor_profile_id, index: true

      t.timestamps
    end
    add_index :load_expenses, :load_id
  end
end
