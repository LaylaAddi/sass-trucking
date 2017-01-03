class AddIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :hrc_user_id, :integer, index: true
    add_column :messages, :driver_user_id, :integer, index: true
  end
end
