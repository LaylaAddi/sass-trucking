class AddPlateToTruck < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :plate, :string


  end
end
