class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :driver_user_id, index: true
      t.integer :hrc_user_id, index: true
      t.integer :shipper_user_id, index: true

      t.timestamps
    end
  end
end
