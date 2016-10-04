require 'rails_helper'

RSpec.describe "Invoice item record API" do
  it "returns a list of invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end

  it "returns one invoice item" do
    pending
    invoice_item = create(:invoice_item, item_id: 123, invoice_id: 123, quantity: 2, unit_price: 456)

    get "/api/v1/invoice_items/#{invoice_item.id}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.item_id).to eq(123)
    expect(invoice_item.invoice_id).to eq(123)
    expect(invoice_item.quantity).to eq(2)
    expect(invoice_item.unit_price).to eq(456)
  end
end
