require 'rails_helper'

RSpec.describe "Invoice find API" do
  it "finds one invoice by customer id" do
    invoice = create(:invoice, customer_id: 123, merchant_id: 555)

    get "/api/v1/invoices/find?customer_id=123"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["customer_id"]).to eq(123)
    expect(response_invoice["merchant_id"]).to eq(555)
  end

  it "finds one invoice by merchant id" do
    invoice = create(:invoice, customer_id: 123, merchant_id: 555)

    get "/api/v1/invoices/find?merchant_id=555"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["customer_id"]).to eq(123)
    expect(response_invoice["merchant_id"]).to eq(555)
  end

  it "finds one invoice by status" do
    invoice = create(:invoice, status: "test status", merchant_id: 555)

    get "/api/v1/invoices/find?merchant_id=555"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["status"]).to eq("test status")
    expect(response_invoice["merchant_id"]).to eq(555)
  end
end
