class AddSalesrepresentativeIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :salesrepresentative_id, :integer
  end
end
