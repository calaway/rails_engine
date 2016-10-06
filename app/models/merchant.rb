class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.top_item_merchants(num)
    joins(:invoice_items).
    group('merchants.id').
    order('sum(quantity) desc').
    limit(num)
  end

  def revenue
    successful_transactions.
    joins(:invoice_items).
    sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def successful_transactions
    transactions.where(result: "success")
  end
end
