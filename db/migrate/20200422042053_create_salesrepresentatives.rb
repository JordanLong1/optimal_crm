class CreateSalesrepresentatives < ActiveRecord::Migration[6.0]
  def change
    create_table :salesrepresentatives do |t|
      t.string :name
      t.string :email 
      t.string :password_digest
      t.timestamps
    end
  end
end
