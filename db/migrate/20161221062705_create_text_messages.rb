class CreateTextMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :text_messages do |t|
      t.string :to
      t.string :from
      t.string :status
      t.string :body
      t.string :message_sid
      t.string :account_sid
      t.string :messaging_service_sid
      t.string :direction
      t.integer :driver_user_id, index: true
      t.integer :hrc_user_id, index: true
      t.integer :shipper_user_id, index: true
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
