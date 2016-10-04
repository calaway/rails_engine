class AddCustomerAndMerchantToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :customer, foreign_key: true
    add_reference :invoices, :merchant, foreign_key: true
  end
end
