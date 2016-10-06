require 'rails_helper'

RSpec.describe "Invoice items API" do
  it "returns a collection of associated items" do
    invoice_1 = create(:invoice_with_items, items_count: 3)
    invoice_2 = create(:invoice_with_items, items_count: 2)

    get "/api/v1/invoices/#{invoice_1.id}/items"
    item_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(item_response.count).to eq(3)
    expect(item_response.first["id"]).to eq(invoice_1.items.first.id)
  end
end
