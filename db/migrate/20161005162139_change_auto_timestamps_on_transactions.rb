class ChangeAutoTimestampsOnTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :created_at
    remove_column :transactions, :updated_at

    add_column :transactions, :created_at, :datetime
    add_column :transactions, :updated_at, :datetime
  end
end
