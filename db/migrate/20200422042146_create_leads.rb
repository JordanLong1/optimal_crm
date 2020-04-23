class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :name 
      t.string :email 
      t.string :phone_number 
      t.boolean :customer 
      t.timestamps
    end
  end
end
