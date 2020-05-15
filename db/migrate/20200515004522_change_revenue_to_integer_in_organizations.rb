class ChangeRevenueToIntegerInOrganizations < ActiveRecord::Migration[6.0]
  def change
    change_column :organizations, :revenue, :integer
  end
end
