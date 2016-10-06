require 'rails_helper'

RSpec.describe "Invoice item find API" do
  it "finds invoice item by item id" do
    create(:invoice_item)
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(response_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
  end

  it "finds invoice item by invoice id" do
    create(:invoice_item)
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(response_invoice_item["item_id"]).to eq(invoice_item.item_id)
  end

  it "finds invoice item by quantity" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, quantity: 2)

    get "/api/v1/invoice_items/find?quantity=2"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["quantity"]).to eq(2)
    expect(response_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
  end

  it "finds invoice item by unit price" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, unit_price: 333)

    get "/api/v1/invoice_items/find?unit_price=333"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["unit_price"]).to eq("3.33")
    expect(response_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
  end
end
