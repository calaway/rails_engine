require 'rails_helper'

RSpec.describe "Invoice invoice items API" do
  it "returns a collection of associated invoice items" do
    invoice_1 = create(:invoice_with_invoice_items, invoice_items_count: 3)
    invoice_2 = create(:invoice_with_invoice_items, invoice_items_count: 2)

    get "/api/v1/invoices/#{invoice_2.id}/invoice_items"
    response_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice_items.count).to eq(2)
    expect(response_invoice_items.first["id"]).to eq(invoice_2.invoice_items.first.id)
  end
end
