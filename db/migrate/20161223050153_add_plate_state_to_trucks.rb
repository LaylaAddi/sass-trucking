class AddPlateStateToTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :plate_state, :string
  end
end
