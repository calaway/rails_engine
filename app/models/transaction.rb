class Transaction < ApplicationRecord
  default_scope { order('id asc') }

  belongs_to :invoice
  has_many :invoice_items, through: :invoice
end
