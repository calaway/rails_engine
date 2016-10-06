class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions,  through: :invoices
  has_many :invoice_items, through: :invoices

  def self.top_item_merchants(num)
    Merchant.joins(:transactions).where("transactions.result = 'success'").joins(:invoice_items).group('merchants.id').order("sum(invoice_items.quantity) desc").limit(num)
  end

  # def customers_with_pending_invoices
  #   SELECT DISTINCT(customers.id), customers.* FROM customers
  #   INNER JOIN invoices     ON invoices.customer_id    = customer.id
  #   INNER JOIN transactions ON transactions.invoice_id = invoices.id
  #   WHERE invoices.merchant_id = 17
  #   WHERE transactions.result = "failed"
  # end
end
