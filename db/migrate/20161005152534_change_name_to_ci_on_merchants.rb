class ChangeNameToCiOnMerchants < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    change_column :merchants, :name, :citext
  end
end
