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

  it "finds one transaction by credit_card_number" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")

    get "/api/v1/transactions/find?credit_card_number=4654405418249632"
    response_transaction = JSON.parse(response.body)

    expect(response_transaction["id"]).to eq(transaction.id)
  end

  it "finds one transaction by result" do
    cc = "4654405418249632"
    create(:transaction, result: "failed")
    create(:transaction, result: "success", credit_card_number: cc)

    get "/api/v1/transactions/find?result=success"
    response_transaction = JSON.parse(response.body)

    expect(response_transaction["credit_card_number"]).to eq(cc)
  end
end
