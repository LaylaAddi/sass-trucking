class AddTableToSchema < ActiveRecord::Migration[5.0]

  def change
    add_column :trailers, :plate_state, :string
    add_column :trailers, :plate_state, :string
  end
end
