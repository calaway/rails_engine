require 'rails_helper'

RSpec.describe "Invoice find all API" do
  it "finds many invoices by merchant id" do
    create(:invoice)
    create(:invoice, customer_id: 123, merchant_id: 555)
    create(:invoice, customer_id: 321, merchant_id: 555)

    get "/api/v1/invoices/find_all?merchant_id=555"
    response_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoices.first["customer_id"]).to eq(123)
    expect(response_invoices.last["customer_id"]).to eq(321)
  end

  it "finds many invoices by customer id" do
    create(:invoice)
    create(:invoice, customer_id: 123, merchant_id: 555)
    create(:invoice, customer_id: 123, merchant_id: 444)

    get "/api/v1/invoices/find_all?customer_id=123"
    response_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoices.first["merchant_id"]).to eq(555)
    expect(response_invoices.last["merchant_id"]).to eq(444)
  end

  it "finds many invoices by status" do
    create(:invoice)
    create(:invoice, customer_id: 123, status: "Completed")
    create(:invoice, customer_id: 321, status: "Completed")

    get "/api/v1/invoices/find_all?status=Completed"
    response_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoices.first["customer_id"]).to eq(123)
    expect(response_invoices.last["customer_id"]).to eq(321)
  end
end
