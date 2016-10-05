require 'rails_helper'

describe "Merchants find all API" do
  it "finds all merchants by id" do
    create(:merchant)
    merchant = create(:merchant, name: "Turing Safe Cracking")

    get "/api/v1/merchants/find_all?id=#{merchant.id}"
    response_merchants = JSON.parse(response.body)

    expect(response_merchants.first["name"]).to eq("Turing Safe Cracking")
  end

  it "finds all merchants by name" do
    create(:merchant)
    merchant_1 = create(:merchant, name: "Turing Safe Cracking")
    merchant_2 = create(:merchant, name: "Turing Safe Cracking")

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"
    response_merchants = JSON.parse(response.body)

    expect(response_merchants.count).to eq(2)
    expect(response_merchants.first["id"]).to eq(merchant_1.id)
  end

end
