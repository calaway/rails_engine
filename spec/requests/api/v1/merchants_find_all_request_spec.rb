require 'rails_helper'

describe "Merchants find all API" do
  it "finds all merchants by id" do
    create(:merchant)
    merchant = create(:merchant, name: "Turing Safe Cracking")

    get "/api/v1/merchants/find_all?id=#{merchant.id}"
    response_merchants = JSON.parse(response.body)

    expect(response_merchants.first["name"]).to eq("Turing Safe Cracking")
  end
end
