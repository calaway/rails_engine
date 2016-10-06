class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.top_item_merchants(num)
    joins(:invoice_items).
    group("merchants.id").
    order('sum(invoice_items.quantity) desc').
    limit(num)
  end
end
