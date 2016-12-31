class ChangeDataTypeCompanyProfileId < ActiveRecord::Migration[5.0]
  def change

    remove_column :mcs, :company_profile_id, :string
    add_column :mcs, :company_profile_id, :integer
  end
end
