require 'rails_helper'

RSpec.describe "Item find all API" do
  it "finds many items by name" do
    create(:item)
    item = create(:item, merchant_id: 123, name: "Acorn")
    item = create(:item, merchant_id: 456, name: "Acorn")

    get "/api/v1/items/find_all?name=acorn"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["merchant_id"]).to eq(123)
    expect(response_items.last["merchant_id"]).to eq(456)
  end

  it "finds many items by description" do
    create(:item)
    item = create(:item, merchant_id: 123, description: "foofoo")
    item = create(:item, merchant_id: 456, description: "foofoo")

    get "/api/v1/items/find_all?description=FOofOo"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["merchant_id"]).to eq(123)
    expect(response_items.last["merchant_id"]).to eq(456)
  end

  it "finds many items by unit price" do
    create(:item)
    item = create(:item, merchant_id: 123, unit_price: 120)
    item = create(:item, merchant_id: 456, unit_price: 120)

    get "/api/v1/items/find_all?unit_price=120"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["merchant_id"]).to eq(123)
    expect(response_items.last["merchant_id"]).to eq(456)
  end

  it "finds many items by merchant id" do
    create(:item)
    item = create(:item, merchant_id: 123, name: "Dead Dove")
    item = create(:item, merchant_id: 123, name: "Dead Dove")

    get "/api/v1/items/find_all?merchant_id=123"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items.first["name"]).to eq("Dead Dove")
    expect(response_items.last["name"]).to eq("Dead Dove")
  end
end
