require 'rails_helper'

describe "Transactions find all API" do
  it "finds all transactions by id" do
    create(:transaction)
    transaction = create(:transaction, credit_card_number: "4654405418249632")

    get "/api/v1/transactions/find_all?id=#{transaction.id}"
    tr_response = JSON.parse(response.body)

    expect(tr_response.first["credit_card_number"]).to eq("4654405418249632")
  end

  it "finds all transactions by invoice_id" do
    create(:transaction)
    cc = "4654405418249632"
    transaction = create(:transaction, credit_card_number: cc)

    get "/api/v1/transactions/find_all?invoice_id=#{transaction.invoice_id}"
    tr_response = JSON.parse(response.body)

    expect(tr_response.first["credit_card_number"]).to eq(cc)
  end

  it "finds all transactions by credit_card_number" do
    create(:transaction)
    cc = "4654405418249632"
    transaction_1 = create(:transaction, credit_card_number: cc)
    transaction_2 = create(:transaction, credit_card_number: cc)

    get "/api/v1/transactions/find_all?credit_card_number=#{cc}"
    tr_response = JSON.parse(response.body)

    expect(tr_response.count).to eq(2)
    expect(tr_response.first["id"]).to eq(transaction_1.id)
  end

  it "finds all transactions by result" do
    cc = "4654405418249632"
    create(:transaction, result: "failed")
    create(:transaction, result: "success",
                         credit_card_number: "4654405418249632")
    create(:transaction, result: "success",
                         credit_card_number: "4140149827486249")

    get "/api/v1/transactions/find_all?result=success"
    tr_response = JSON.parse(response.body)

    expect(tr_response.count).to eq(2)
    expect(tr_response.first["credit_card_number"]).to eq("4654405418249632")
  end
end
