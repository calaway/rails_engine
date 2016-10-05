require 'rails_helper'

RSpec.describe "Merchant items API" do
  it "finds all items for a given merchant" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    3.times do
      create(:item, merchant: merchant_1)
    end
    create(:item, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/items"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end
end
