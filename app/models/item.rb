class Item < ApplicationRecord
  default_scope { order('id asc') }

  belongs_to :merchant
end
