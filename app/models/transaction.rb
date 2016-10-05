class Transaction < ApplicationRecord
  default_scope { order('id asc') }
  
  belongs_to :invoice
end
