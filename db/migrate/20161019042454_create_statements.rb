class CreateStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :statements do |t|
      t.decimal :insurance_payment
      t.decimal :trailer_rental
      t.decimal :truck_rental
      t.decimal :escrow
      t.integer :driver_user_id, index: true

      t.timestamps
    end
  end
end
