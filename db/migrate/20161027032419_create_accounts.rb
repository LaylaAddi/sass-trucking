class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.decimal :first_week_hb
      t.decimal :escrow_total
      t.string :notes_1
      t.string :notes_2
      t.decimal :acct_dec_1
      t.decimal :acct_dec_2
      t.decimal :acct_dec_3
      t.string :acct_str_1
      t.string :acct_str_2
      t.string :acct_str_3
      t.integer :acct_int_1
      t.integer :acct_int_2
      t.integer :accountable_id 
      t.string :accountable_type
    t.index [:accountable_id, :accountable_type]
      t.timestamps
    end
  end
end
