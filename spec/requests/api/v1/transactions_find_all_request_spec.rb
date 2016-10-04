require 'rails_helper'

describe "Transactions find all API" do
  it "finds all transactions by id" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")

    get "/api/v1/transactions/find_all?id=#{transaction.id}"
    response_transactions = JSON.parse(response.body)

    expect(response_transactions.first["credit_card_number"]).to eq("4654405418249632")
  end
end
