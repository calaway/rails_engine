require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "finds top item selling merchants" do
    merchant_1 = create(:merchant, name: "A Good Store")
    merchant_2 = create(:merchant, name: "Bluth Family Store")
    merchant_3 = create(:merchant, name: "Some Person's Shed")

    invoice_items_1 = create_list(:invoice_item, 3, quantity: 1)
    invoice_items_2 = create_list(:invoice_item, 2, quantity: 20)
    invoice_items_3 = create_list(:invoice_item, 1, quantity: 1)

    invoice_items_1.each do |invoice_item|
      invoice_item.invoice.update_attribute(:merchant_id, merchant_1.id)
    end

    invoice_items_2.each do |invoice_item|
      invoice_item.invoice.update_attribute(:merchant_id, merchant_2.id)
    end

    invoice_items_3.each do |invoice_item|
      invoice_item.invoice.update_attribute(:merchant_id, merchant_3.id)
    end

    top_2_merchants = Merchant.top_merchants(2)

    expect(top_2_merchants.count.count).to eq(2)
    expect(top_2_merchants.first.name).to eq("Bluth Family Store")
    expect(top_2_merchants.last.name).to eq("A Good Store")
  end
end
