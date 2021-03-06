require 'rails_helper'

RSpec.describe "Customer transactions API" do
  it "finds transactions for a given customer" do
    customer = create(:customer, first_name: "Gob", last_name: "Bluth")
    invoice = create(:invoice, customer: customer)
    3.times do
      transaction = create(:transaction, invoice: invoice)
    end
    create(:transaction)

    get "/api/v1/customers/#{customer.id}/transactions"
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(3)
  end
end
