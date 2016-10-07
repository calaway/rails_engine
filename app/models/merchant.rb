class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions,  through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def active_model_serializer
    MerchantRevenueSerializer
  end

  def self.top_item_merchants(num)
    joins(:invoice_items).
    joins("INNER JOIN transactions ON transactions.invoice_id = invoice_items.invoice_id").
    where("transactions.result = 'success'").
    group('merchants.id').
    order("sum(invoice_items.quantity) desc").
    limit(num)
  end

  def self.top_revenue_merchants(num)
    num = num.to_i
    Merchant.all.sort_by{ |m| m.revenue }.reverse[0..num - 1]
  end

  def revenue
    successful_transactions.
    joins(:invoice_items).
    sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def revenue_by_date(date)
    successful_transactions.
    joins(:invoice).
    where(invoices: { created_at: date }).
    joins(:invoice_items).
    sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def successful_transactions
    transactions.where(result: "success")
  end

  def favorite_customer
    Customer.
    joins(:transactions).
    where("transactions.result = 'success'").
    joins(:invoices).
    where("invoices.merchant_id = #{self.id}").
    group('customers.id').
    order('count(transactions.*) desc').first
  end
end
