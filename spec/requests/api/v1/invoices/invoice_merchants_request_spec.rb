require 'rails_helper'

RSpec.describe "Invoice merchants API" do
  it "returns the associated merchant" do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)

    get "/api/v1/invoices/#{invoice_2.id}/merchant"
    merchant_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant_response["id"]).to eq(invoice_2.merchant_id)
  end
end
