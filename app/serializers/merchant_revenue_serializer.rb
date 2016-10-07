class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    "%.2f" % (object / 100.0)
  end
end
