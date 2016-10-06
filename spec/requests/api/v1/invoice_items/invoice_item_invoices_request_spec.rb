require 'rails_helper'

RSpec.describe "Invoice items invoices API" do
  it "returns the associated invoice" do
    invoice_item_1 = create(:invoice_item)
    invoice_item_2 = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item_2.id}/invoice"
    invoice_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_response["id"]).to eq(invoice_item_2.invoice_id)
  end
end
