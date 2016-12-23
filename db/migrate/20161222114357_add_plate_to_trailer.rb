class AddPlateToTrailer < ActiveRecord::Migration[5.0]
  def change
    add_column :trailers, :plate, :string
  end
end
