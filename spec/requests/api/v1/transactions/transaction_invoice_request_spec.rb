require 'rails_helper'

RSpec.describe "Transaction invoice API" do
  it "finds the invoice for a given transaction" do
    invoice = create(:invoice, status: "test status")
    transaction = create(:transaction, invoice: invoice)
    create(:invoice, status: "if you get this the test failed")

    get "/api/v1/transactions/#{transaction.id}/invoice"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["status"]).to eq("test status")
  end
end
