class ChangeAutotimestampsOnInvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :created_at
    remove_column :invoices, :updated_at

    add_column :invoices, :created_at, :datetime
    add_column :invoices, :updated_at, :datetime
  end
end
