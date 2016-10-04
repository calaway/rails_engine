require 'rails_helper'

RSpec.describe "Invoice item find API" do
  it "finds invoice item by item id" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, item_id: 123, invoice_id: 456)

    get "/api/v1/invoice_items/find?item_id=123"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["item_id"]).to eq(123)
    expect(response_invoice_item["invoice_id"]).to eq(456)
  end

  it "finds invoice item by invoice id" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, item_id: 123, invoice_id: 456)

    get "/api/v1/invoice_items/find?invoice_id=456"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["invoice_id"]).to eq(456)
    expect(response_invoice_item["item_id"]).to eq(123)
  end

  it "finds invoice item by quantity" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, quantity: 2, invoice_id: 456)

    get "/api/v1/invoice_items/find?quantity=2"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["quantity"]).to eq(2)
    expect(response_invoice_item["invoice_id"]).to eq(456)
  end

  it "finds invoice item by unit price" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, unit_price: 333, invoice_id: 456)

    get "/api/v1/invoice_items/find?unit_price=333"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["unit_price"]).to eq(333)
    expect(response_invoice_item["invoice_id"]).to eq(456)
  end
end
