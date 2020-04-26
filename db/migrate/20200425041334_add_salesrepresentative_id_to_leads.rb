class AddSalesrepresentativeIdToLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :salesrepresentative_id, :integer
  end
end
