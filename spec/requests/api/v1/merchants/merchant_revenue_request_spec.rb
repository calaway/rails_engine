require 'rails_helper'

RSpec.describe "Merchant revenue API" do
  it "returns revenue for a given merchant" do
    merchant = create(:merchant)
    invoice_items = create_list(:invoice_item, 3, quantity: 3, unit_price: 200)
    create(:invoice_item, quantity: 1, unit_price: 1000000)

    invoice_items.each do |ii|
      ii.invoice.update_attribute(:merchant_id, merchant.id)
      create(:transaction, invoice: ii.invoice, result: "success")
    end

    get "/api/v1/merchants/#{merchant.id}/revenue"
    revenue = JSON.parse(response.body)

    expect(revenue).to eq(1800)
  end
end
