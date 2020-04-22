class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|

      t.timestamps
    end
  end
end
