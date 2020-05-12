class AddUidToSalesrepresentatives < ActiveRecord::Migration[6.0]
  def change
    add_column :salesrepresentatives, :uid, :string
  end
end
