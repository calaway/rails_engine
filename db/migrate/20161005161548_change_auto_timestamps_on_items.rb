class ChangeAutoTimestampsOnItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :created_at
    remove_column :items, :updated_at

    add_column :items, :created_at, :datetime
    add_column :items, :updated_at, :datetime
  end
end
