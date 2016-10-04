class Invoice < ApplicationRecord
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant
end
