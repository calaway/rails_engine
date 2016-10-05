class ChangeStatusToCitextInvoices < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    change_column :invoices, :status, :citext
  end
end
