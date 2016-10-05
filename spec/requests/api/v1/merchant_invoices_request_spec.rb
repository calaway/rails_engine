require 'rails_helper'

RSpec.describe "Merchant invoices API" do
  it "finds all invoices for a given merchant" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    3.times do
      create(:invoice, merchant: merchant_1)
    end
    create(:invoice, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/invoices"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end
end
