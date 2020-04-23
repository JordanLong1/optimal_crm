class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title 
      t.string :content 
      t.boolean :complete
      t.datetime :created_at 
      t.datetime :updated_at 
      t.timestamps
    end
  end
end
