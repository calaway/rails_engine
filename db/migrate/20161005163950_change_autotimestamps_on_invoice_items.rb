class ChangeAutotimestampsOnInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoice_items, :created_at
    remove_column :invoice_items, :updated_at

    add_column :invoice_items, :created_at, :datetime
    add_column :invoice_items, :updated_at, :datetime
  end
end
