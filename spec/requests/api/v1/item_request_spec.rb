require 'rails_helper'

RSpec.describe "Item record API" do
  it "returns a list of items" do
    create_list(:item, 3)

    get api_v1_items_path
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end

  it "returns one item" do
    item = create(:item, name: "Dead Dove", description: "Do not eat!", unit_price: 200)

    get api_v1_item_path(item)
    response_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_item.name).to eq("Dead Dove")
    expect(response_item.description).to eq("Do not eat!")
    expect(response_item.unit_price).to eq(200)
    expect(response_item.merchant_id).to eq(item.merchan)
  end
end
