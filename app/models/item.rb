class Item < ApplicationRecord
  default_scope { order('id asc') }

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
end
