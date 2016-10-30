class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.decimal :week_pay
      t.decimal :escrow_pay
      t.decimal :trans_dec_1
      t.decimal :trans_dec_2
      t.decimal :trans_dec_3
      t.integer :trans_int_1
      t.integer :trans_int_2
      t.string :trans_str_1
      t.string :trans_str_2
      t.string :trans_str_3
      t.integer :account_id, index: true

      t.timestamps
    end
  end
end
