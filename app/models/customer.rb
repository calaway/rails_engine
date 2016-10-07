class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

    def favorite_merchant
      Merchant.
      joins(:transactions).
      where("transactions.result = 'success'").
      joins(:invoices).
      where("invoices.customer_id = #{self.id}").
      group('merchants.id').
      order('count(transactions.*) desc').first
    end
end
