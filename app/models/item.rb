class Item < ApplicationRecord
  default_scope { order('id asc') }

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.most_revenue(num)
    joins(:invoice_items).
    joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id").
    where("transactions.result = 'success'").
    group("items.id").
    order("sum(invoice_items.quantity * invoice_items.unit_price) desc").
    limit(num)
  end
end
