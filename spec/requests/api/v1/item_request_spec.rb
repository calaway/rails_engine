require 'rails_helper'

RSpec.describe "Item record API" do
  it "returns a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end

  it "returns one item" do
    item = create(:item, name: "Dead Dove", description: "Do not eat!", unit_price: 200, merchant_id: 456)

    get "/api/v1/items/#{item.id}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.name).to eq("Dead Dove")
    expect(item.description).to eq("Do not eat!")
    expect(item.unit_price).to eq(200)
    expect(item.merchant_id).to eq(456)
  end
end
