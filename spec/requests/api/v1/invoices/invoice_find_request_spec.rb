require 'rails_helper'

RSpec.describe "Invoice find API" do
  it "finds one invoice by customer id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(response_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "finds one invoice by merchant id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(response_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "finds one invoice by status" do
    invoice = create(:invoice, status: "test status")

    get "/api/v1/invoices/find?status=#{invoice.status}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["status"]).to eq("test status")
  end
end
