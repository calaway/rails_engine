require 'rails_helper'

RSpec.describe "Merchant random API" do
  it "finds a random merchant" do
    create_list(:merchant, 3)

    get '/api/v1/merchants/random'
    random_merchant = JSON.parse(response.body)

    expect(random_merchant["name"].class).to eq(String)
  end
end
