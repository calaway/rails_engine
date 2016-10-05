class ChangeAutoTimestampsOnCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :created_at
    remove_column :customers, :updated_at

    add_column :customers, :created_at, :datetime
    add_column :customers, :updated_at, :datetime
  end
end
