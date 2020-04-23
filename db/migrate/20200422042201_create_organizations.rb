class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name 
      t.string :revenue 
      t.string :country 
      t.string :city 
      t.string :state 
      t.string :address 
      t.integer :user_id
      t.boolean :customer
      t.timestamps
    end
  end
end
