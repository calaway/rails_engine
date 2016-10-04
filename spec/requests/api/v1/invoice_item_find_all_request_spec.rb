require 'rails_helper'

RSpec.describe "Invoice item find all API" do
  it "finds many invoice items by item id" do
    item = create(:item)
    create(:invoice_item)
    create(:invoice_item, item: item)
    create(:invoice_item, item: item)

    get "/api/v1/invoice_items/find_all?item_id=#{item.id}"
    response_invoice_items = JSON.parse(response.body)

    expect(response_invoice_items.count).to eq(2)
  end

  it "finds many invoice items by invoice id" do
    create(:invoice_item)
    create(:invoice_item, item_id: 123, invoice_id: 300)
    create(:invoice_item, item_id: 456, invoice_id: 300)

    get "/api/v1/invoice_items/find_all?invoice_id=300"
    response_invoice_items = JSON.parse(response.body)

    expect(response_invoice_items.first["item_id"]).to eq(123)
    expect(response_invoice_items.last["item_id"]).to eq(456)
  end

  it "finds many invoice items by quantity" do
    create(:invoice_item)
    create(:invoice_item, item_id: 123, quantity: 30)
    create(:invoice_item, item_id: 456, quantity: 30)

    get "/api/v1/invoice_items/find_all?quantity=30"
    response_invoice_items = JSON.parse(response.body)

    expect(response_invoice_items.first["item_id"]).to eq(123)
    expect(response_invoice_items.last["item_id"]).to eq(456)
  end

  it "finds many invoice items by unit price" do
    create(:invoice_item)
    create(:invoice_item, item_id: 123, unit_price: 300)
    create(:invoice_item, item_id: 456, unit_price: 300)

    get "/api/v1/invoice_items/find_all?unit_price=300"
    response_invoice_items = JSON.parse(response.body)

    expect(response_invoice_items.first["item_id"]).to eq(123)
    expect(response_invoice_items.last["item_id"]).to eq(456)
  end
end
