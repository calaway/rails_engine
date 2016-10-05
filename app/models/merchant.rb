class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def self.top_item_merchants(num)
    group(:id).joins(:invoice_items).order('sum(quantity) desc').limit(num)
  end
end
