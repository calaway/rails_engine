require 'rails_helper'

describe "Merchants find API" do
  it "finds one merchant by id" do
    create(:merchant)
    merchant = create(:merchant, name: "Turing Safe Cracking")

    get "/api/v1/merchants/find?id=#{merchant.id}"
    response_merchant = JSON.parse(response.body)

    expect(response_merchant["name"]).to eq("Turing Safe Cracking")
  end

  it "finds one merchant by name" do
    create(:merchant)
    merchant = create(:merchant, name: "Turing Safe Cracking")

    get "/api/v1/merchants/find?name=#{merchant.name}"
    response_merchant = JSON.parse(response.body)

    expect(response_merchant["name"]).to eq("Turing Safe Cracking")
  end
end
