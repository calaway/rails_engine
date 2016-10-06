class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions,  through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.top_item_merchants(num)
    joins(:invoice_items).
    joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id").
    where("transactions.result = 'success'").
    group('merchants.id').
    order("sum(invoice_items.quantity) desc").
    limit(num)
  end

  # def customers_with_pending_invoices
  #   SELECT DISTINCT(customers.id), customers.* FROM customers
  #   INNER JOIN invoices     ON invoices.customer_id    = customer.id
  #   INNER JOIN transactions ON transactions.invoice_id = invoices.id
  #   WHERE invoices.merchant_id = 17
  #   WHERE transactions.result = "failed"
  # end

  def revenue_hash
    {revenue: (revenue / 100.0).to_s }
  end

  def revenue
    successful_transactions.
    joins(:invoice_items).
    sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def revenue_by_date(date)
    require "pry"; binding.pry
    Merchant.find(params[:id]).
    transactions.
    where(result: "success").

    joins(:invoice).
    where(invoices: { created_at: params[:date] }).

    joins(:invoice_items).
    sum('invoice_items.quantity * invoice_items.unit_price')

  end

  def successful_transactions
    transactions.where(result: "success")
  end
end
