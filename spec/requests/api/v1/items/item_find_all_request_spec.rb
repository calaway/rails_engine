require 'rails_helper'

RSpec.describe "Item find all API" do
  it "finds many items by name" do
    create(:item)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    create(:item, name: "Acorn", merchant: merchant_1)
    create(:item, name: "Acorn", merchant: merchant_2)

    get "/api/v1/items/find_all?name=Acorn"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["merchant_id"]).to eq(merchant_1.id)
    expect(response_items.last["merchant_id"]).to eq(merchant_2.id)
  end

  it "finds many items by description" do
    create(:item)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item = create(:item, merchant: merchant_1, description: "foofoo")
    item = create(:item, merchant: merchant_2, description: "foofoo")

    get "/api/v1/items/find_all?description=foofoo"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["merchant_id"]).to eq(merchant_1.id)
    expect(response_items.last["merchant_id"]).to eq(merchant_2.id)
  end

  it "finds many items by unit price" do
    create(:item)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item = create(:item, merchant: merchant_1, unit_price: 120)
    item = create(:item, merchant: merchant_2, unit_price: 120)

    get "/api/v1/items/find_all?unit_price=120"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["merchant_id"]).to eq(merchant_1.id)
    expect(response_items.last["merchant_id"]).to eq(merchant_2.id)
  end

  it "finds many items by merchant id" do
    create(:item)
    merchant = create(:merchant)
    item = create(:item, merchant: merchant, name: "Dead Dove")
    item = create(:item, merchant: merchant, name: "Dead Dove")

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["name"]).to eq("Dead Dove")
    expect(response_items.last["name"]).to eq("Dead Dove")
  end
end
