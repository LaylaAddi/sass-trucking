class CreateLoads < ActiveRecord::Migration[5.0]
  def change
    create_table :loads do |t|
      t.string :commodity
      t.string :weight
      t.string :units
      t.string :load_size
      t.decimal :rate
      t.integer :distance
      t.datetime :pick_up_time
      t.datetime :delevery_time
      t.string :equipment_type
      t.string :status_name 
      t.integer :hrc_user_id, index: true
      t.integer :driver_user_id, index: true

      t.timestamps
    end
  end
end
