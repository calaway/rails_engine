require 'rails_helper'

RSpec.describe "Item find API" do
  it "finds one item by name" do
    create(:item)
    item = create(:item, name: "Acorn")

    get "/api/v1/items/find?name=Acorn"
    response_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_item["name"]).to eq("Acorn")
    expect(response_item["merchant_id"]).to eq(item.merchant.id)
  end

  it "finds one item by description" do
    create(:item)
    item = create(:item, description: "It is an acorn", name: "Acorn")

    get "/api/v1/items/find?description=#{item.description}"
    response_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_item["name"]).to eq("Acorn")
    expect(response_item["description"]).to eq("It is an acorn")
  end

  it "finds one item by unit price" do
    create(:item)
    item = create(:item, unit_price: 100, name: "Acorn")

    get "/api/v1/items/find?unit_price=100"
    response_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_item["name"]).to eq("Acorn")
    expect(response_item["unit_price"]).to eq("1.00")
  end

  it "finds one item by merchant_id" do
    create(:item)
    item = create(:item, name: "Acorn")

    get "/api/v1/items/find?merchant_id=#{item.merchant_id}"
    response_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_item["name"]).to eq("Acorn")
    expect(response_item["merchant_id"]).to eq(item.merchant_id)
  end
end
