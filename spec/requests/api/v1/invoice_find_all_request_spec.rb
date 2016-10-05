require 'rails_helper'

RSpec.describe "Invoice find all API" do
  it "finds many invoices by merchant id" do
    merchant = create(:merchant)
    create(:invoice)
    create(:invoice, merchant: merchant)
    create(:invoice, merchant: merchant)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"
    response_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoices.count).to eq(2)
  end

  it "finds many invoices by customer id" do
    customer = create(:customer)
    create(:invoice)
    create(:invoice, customer: customer)
    create(:invoice, customer: customer)

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"
    response_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoices.count).to eq(2)
  end

  it "finds many invoices by status" do
    create(:invoice)
    create(:invoice, status: "Completed")
    create(:invoice, status: "Completed")

    get "/api/v1/invoices/find_all?status=Completed"
    response_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoices.count).to eq(2)
  end
end
