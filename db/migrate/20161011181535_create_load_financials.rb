class CreateLoadFinancials < ActiveRecord::Migration[5.0]
  def change
    create_table :load_financials do |t|
      t.decimal :gross_rate
      t.decimal :percent_deducted
      t.integer :miles
      t.decimal :gross_rpm

      t.decimal :dollars_deducted_based_on_percent
      t.decimal :gross_rate_after_percent
      t.decimal :after_percent_deducted_rpm
      t.decimal :load_expense
      t.decimal :net_load_rate
      t.decimal :net_rpm
      t.integer :load_id, index: true

      t.timestamps
    end
  end
end
