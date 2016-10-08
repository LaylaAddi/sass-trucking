class CreateCompanyProfileMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :company_profile_memberships do |t|
      t.integer :company_profile_id
      t.integer :user_id
      t.string :membership_type
      t.index [:user_id, :company_profile_id], name: 'user_company_profile'

      t.timestamps
    end
    add_index :company_profile_memberships, :company_profile_id
    add_index :company_profile_memberships, :user_id

  end
end
