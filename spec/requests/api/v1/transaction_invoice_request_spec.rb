require 'rails_helper'

RSpec.describe "Transaction invoice API" do
  it "finds the invoice for a given transaction" do
    transaction = create(:transaction)
    create(:invoice, transaction: transaction, status: "test status")
    create(:invoice, status: "if you get this the test failed")

    get "/api/v1/transactions/#{transaction.id}/invoice"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.status).to eq("test status")
  end
end
