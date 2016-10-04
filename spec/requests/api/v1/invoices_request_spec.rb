require 'rails_helper'

RSpec.describe "Invoice record API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end

  it "returns one invoice" do
    invoice = create(:invoice, customer_id: 123, merchant_id: 123, status: "This is a test")

    get "/api/v1/invoices/#{invoice.id}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["status"]).to eq("This is a test")
    expect(response_invoice["customer_id"]).to eq(123)
    expect(response_invoice["merchant_id"]).to eq(123)
  end
end
