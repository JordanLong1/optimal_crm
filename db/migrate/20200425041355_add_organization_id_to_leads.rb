class AddOrganizationIdToLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :organization_id, :integer
  end
end
