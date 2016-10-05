class ChangeAutotimestampsOnMerchants < ActiveRecord::Migration[5.0]
  def change
    remove_column :merchants, :created_at
    remove_column :merchants, :updated_at

    add_column :merchants, :created_at, :datetime
    add_column :merchants, :updated_at, :datetime
  end
end
