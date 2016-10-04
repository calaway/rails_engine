require 'rails_helper'

RSpec.describe "Invoice item record API" do
  it "returns a list of invoice items" do
    create_list(:invoice_item, 3)

    get api_v1_invoice_items_path
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end

  it "returns one invoice item" do
    invoice_item = create(:invoice_item, item_id: 123, invoice_id: 123, quantity: 2, unit_price: 456)

    get api_v1_invoice_item_path(invoice_item)
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.item_id).to eq(123)
    expect(invoice_item.invoice_id).to eq(123)
    expect(invoice_item.quantity).to eq(2)
    expect(invoice_item.unit_price).to eq(456)
  end

  it "finds invoice item by item id" do
    create(:invoice_item)
    invoice_item = create(:invoice_item, item_id: 123, invoice_id: 456)

    get "/api/v1/invoice_items/find?item_id=123"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["item_id"]).to eq(123)
    expect(response_invoice_item["invoice_id"]).to eq(456)
  end

  it "finds invoice item by invoice id" do
    pending
    create(:invoice_item)
    invoice_item = create(:invoice_item, item_id: 123, invoice_id: 456)

    get "/api/v1/invoice_items/find?invoice_id=456"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["invoice_id"]).to eq(456)
    expect(response_invoice_item["item_id"]).to eq(123)
  end

  it "finds invoice item by quantity" do
    pending
    create(:invoice_item)
    invoice_item = create(:invoice_item, quantity: 2, invoice_id: 456)

    get "/api/v1/invoice_items/find?quantity=2"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["quantity"]).to eq(2)
    expect(response_invoice_item["invoice_id"]).to eq(456)
  end

  it "finds invoice item by unit price" do
    pending
    create(:invoice_item)
    invoice_item = create(:invoice_item, unit_price: 333, invoice_id: 456)

    get "/api/v1/invoice_items/find?unit_price=333"
    response_invoice_item = JSON.parse(response.body)

    expect(response_invoice_item["unit_price"]).to eq(333)
    expect(response_invoice_item["invoice_id"]).to eq(456)
  end
end
