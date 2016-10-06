require 'rails_helper'

describe "Merchants API" do
  it "returns a list of merchants" do
    create_list(:merchant, 2)

    get '/api/v1/merchants'
    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq(2)
  end

  it "returns a single merchant" do
    id = create(:merchant, name: "Bob's Best Plumbing").id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end
end
