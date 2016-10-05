require 'rails_helper'

RSpec.describe "Transaction random API" do
  it "finds a random transaction" do
    create_list(:transaction, 3)

    get '/api/v1/transactions/random'
    random_transaction = JSON.parse(response.body)

    expect(random_transaction["credit_card_number"].class).to eq(String)
  end
end
