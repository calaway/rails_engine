require 'rails_helper'

RSpec.describe "Invoice item random API" do
  it "finds a random invoice item" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items/random'
    random_invoice_item = JSON.parse(response.body)

    expect(random_invoice_item["item_id"].class).to eq(Fixnum)
    expect(random_invoice_item["invoice_id"].class).to eq(Fixnum)
  end
end
