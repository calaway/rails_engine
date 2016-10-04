require 'rails_helper'

describe "Transactions find API" do
  it "finds one transaction by id" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")

    get "/api/v1/transactions/find?id=#{transaction.id}"
    response_transaction = JSON.parse(response.body)

    expect(response_transaction["credit_card_number"]).to eq("4654405418249632")
  end

  it "finds one transaction by invoice_id" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")
    invoice_id = transaction.invoice.id

    get "/api/v1/transactions/find?invoice_id=#{invoice_id}"
    response_transaction = JSON.parse(response.body)

    expect(response_transaction["credit_card_number"]).to eq("4654405418249632")
    expect(response_transaction["invoice_id"]).to eq(invoice_id)
  end

  xit "finds one transaction by creation time" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"
    response_transaction = JSON.parse(response.body)

    expect(response_transaction["name"]).to eq("Turing Safe Cracking")
  end

  xit "finds one transaction by update time" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")

    get "/api/v1/transactions/find?created_at=#{transaction.updated_at}"
    response_transaction = JSON.parse(response.body)

    expect(response_transaction["name"]).to eq("Turing Safe Cracking")
  end
end