require 'rails_helper'

describe "Transactions API" do
  it "returns a list of transactions" do
    create_list(:transaction, 2)

    get '/api/v1/transactions'
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(2)
  end

  it "returns a single transaction" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end
end
