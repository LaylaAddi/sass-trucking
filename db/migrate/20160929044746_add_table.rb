class AddTable < ActiveRecord::Migration[5.0]
  def change
    create_table :operating_authorities do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :number
      t.string :authority_type
      t.integer :company_id

      t.timestamps
    end
    
  
  end
end
