require 'rails_helper'

RSpec.describe "Item invoice items API" do
  it "returns a collection of associated invoice items" do
    item_1 = create(:item_with_invoice_items, invoice_items_count: 3)
    item_2 = create(:item_with_invoice_items, invoice_items_count: 2)

    get "/api/v1/items/#{item_2.id}/invoice_items"
    response_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice_items.count).to eq(2)
    expect(response_invoice_items.first["id"]).to eq(item_2.invoice_items.first.id)
  end
end
