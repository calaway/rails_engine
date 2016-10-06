require 'rails_helper'

RSpec.describe "Invoice customers API" do
  it "returns the associated customer" do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)

    get "/api/v1/invoices/#{invoice_2.id}/customer"
    customer_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer_response["id"]).to eq(invoice_2.customer_id)
  end
end
