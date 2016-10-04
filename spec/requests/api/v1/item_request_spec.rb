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
    item = create(:item, name: "Dead Dove", description: "Do not eat!", unit_price: 200, merchant_id: 456)

    get api_v1_item_path(item)
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.name).to eq("Dead Dove")
    expect(item.description).to eq("Do not eat!")
    expect(item.unit_price).to eq(200)
    expect(item.merchant_id).to eq(456)
  end

  it "finds one invoice by name" do
    create(:item)
    item = create(:item, merchant_id: 123, name: "Acorn")

    get "/api/v1/items/find?name=Acorn"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["name"]).to eq("Acorn")
    expect(response_invoice["merchant_id"]).to eq(123)
  end

  it "finds one invoice by description" do
    create(:item)
    item = create(:item, description: "It is an acorn", name: "Acorn")

    get "/api/v1/items/find?description=#{item.description}"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["name"]).to eq("Acorn")
    expect(response_invoice["description"]).to eq("It is an acorn")
  end

  it "finds one invoice by unit price" do
    create(:item)
    item = create(:item, unit_price: 100, name: "Acorn")

    get "/api/v1/items/find?unit_price=100"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["name"]).to eq("Acorn")
    expect(response_invoice["unit_price"]).to eq(100)
  end

  it "finds one invoice by merchant_id" do
    create(:item)
    item = create(:item, merchant_id: 123, name: "Acorn")

    get "/api/v1/items/find?merchant_id=123"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["name"]).to eq("Acorn")
    expect(response_invoice["merchant_id"]).to eq(123)
  end
end
