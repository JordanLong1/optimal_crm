class CreateSalesrepresentatives < ActiveRecord::Migration[6.0]
  def change
    create_table :salesrepresentatives do |t|

      t.timestamps
    end
  end
end
