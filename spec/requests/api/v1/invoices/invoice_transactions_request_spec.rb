require 'rails_helper'

RSpec.describe "Invoice transactions API" do
  it "returns a collection of associated transactions" do
    invoice_1 = create(:invoice_with_transactions, transactions_count: 3)
    invoice_2 = create(:invoice_with_transactions, transactions_count: 2)

    get "/api/v1/invoices/#{invoice_1.id}/transactions"
    inv_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(inv_response.count).to be(3)
    expect(inv_response.first["id"]).to eq(invoice_1.transactions.first.id)
  end
end
