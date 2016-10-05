require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "finds top item selling merchants" do
    merchant_1 = create(:merchant, name: "A Good Store")
    merchant_2 = create(:merchant, name: "Bluth Family Store")
    merchant_3 = create(:merchant, name: "Some Person's Shed")

    3.times do
      merchant_1.invoice_items.create(quantity: 2)
    end

    4.times do
      merchant_2.invoice_items.create(quantity: 5)
    end

    1.times do
      merchant_3.invoice_items.create(quantity: 1)
    end

    top_2_merchants = Merchant.top_merchants(2)

    expect(top_2_merchants.count).to eq(2)
    expect(top_2_merchants.first.name).to eq("Bluth Family Store")
    expect(top_2_merchants.last.name).to eq("A Good Store")
  end
end
