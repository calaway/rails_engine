require 'rails_helper'

RSpec.describe "Invoice record API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)

    get api_v1_invoices_path
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end

  it "returns one invoice" do
    invoice = create(:invoice, customer_id: 123, merchant_id: 123, status: "This is a test")

    get api_v1_invoice_path(invoice)
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["status"]).to eq("This is a test")
    expect(response_invoice["customer_id"]).to eq(123)
    expect(response_invoice["merchant_id"]).to eq(123)
  end

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
