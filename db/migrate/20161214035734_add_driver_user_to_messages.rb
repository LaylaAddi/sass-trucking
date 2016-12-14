class AddDriverUserToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :driver_user_id, :string
    add_index :messages, :driver_user_id
  end
end
