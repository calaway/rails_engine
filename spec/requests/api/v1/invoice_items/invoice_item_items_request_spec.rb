require 'rails_helper'

RSpec.describe "Invoice items items API" do
  it "returns the associated item" do
    invoice_item_1 = create(:invoice_item)
    invoice_item_2 = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item_2.id}/item"
    item_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(item_response["id"]).to eq(invoice_item_2.item_id)
  end
end
