class RemoveCustomerIdAndMerchantIdFromInvoices < ActiveRecord::Migration[5.0]
  def change
    remove_column :invoices, :customer_id
    remove_column :invoices, :merchant_id
  end
end
