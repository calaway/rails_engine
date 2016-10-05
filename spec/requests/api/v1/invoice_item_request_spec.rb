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
    invoice_item = create(:invoice_item, quantity: 2, unit_price: 456)

    get api_v1_invoice_item_path(invoice_item)
    response_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice_item["item_id"]).to eq(invoice_item.item.id)
    expect(response_invoice_item["invoice_id"]).to eq(invoice_item.invoice.id)
    expect(response_invoice_item["quantity"]).to eq(2)
    expect(response_invoice_item["unit_price"]).to eq(456)
  end
end
