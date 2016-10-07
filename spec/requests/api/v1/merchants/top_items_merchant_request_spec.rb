require 'rails_helper'

RSpec.describe "Top item merchants API" do
  it "finds top item selling merchants" do
    merchant_1 = create(:merchant, name: "A Good Store")
    merchant_2 = create(:merchant, name: "Bluth Family Store")
    merchant_3 = create(:merchant, name: "Some Person's Shed")

    invoice_items_1 = create_list(:invoice_item, 3, quantity: 1)
    invoice_items_2 = create_list(:invoice_item, 2, quantity: 20)
    invoice_items_3 = create_list(:invoice_item, 1, quantity: 1)

    invoice_items_1.each do |invoice_item|
      invoice_item.invoice.update_attribute(:merchant_id, merchant_1.id)
      create(:transaction, invoice: invoice_item.invoice, result: "success")
    end

    invoice_items_2.each do |invoice_item|
      invoice_item.invoice.update_attribute(:merchant_id, merchant_2.id)
      create(:transaction, invoice: invoice_item.invoice, result: "success")
    end

    invoice_items_3.each do |invoice_item|
      invoice_item.invoice.update_attribute(:merchant_id, merchant_3.id)
      create(:transaction, invoice: invoice_item.invoice, result: "success")
    end

    get "/api/v1/merchants/most_items?quantity=2"
    top_2_merchants = JSON.parse(response.body)

    expect(top_2_merchants.count).to eq(2)
    expect(top_2_merchants.first["name"]).to eq("Bluth Family Store")
    expect(top_2_merchants.last["name"]).to eq("A Good Store")
  end
end
