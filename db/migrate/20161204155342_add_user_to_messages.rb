class AddUserToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :user, :string
    add_column :messages, :latitude, :float
    add_column :messages, :longitude, :float 
    add_column :messages, :to_country, :string
    add_column :messages, :to_state, :string
    add_column :messages, :to_city, :string
    add_column :messages, :to_zip, :string
    add_column :messages, :from_country, :string
    add_column :messages, :from_state, :string
    add_column :messages, :from_city, :string
    add_column :messages, :from_zip, :string
    add_column :messages, :sms_message_sid, :string
    add_column :messages, :num_media, :string
    add_column :messages, :sms_sid, :string

  end
end
