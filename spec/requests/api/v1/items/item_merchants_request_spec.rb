require 'rails_helper'

RSpec.describe "Item merchant API" do
  it "returns the associated merchant" do
    items = create_list(:item, 3)

    get "/api/v1/items/#{items.first.id}/merchant"
    response_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_merchant["id"]).to eq(items.first.merchant_id)
  end
end
