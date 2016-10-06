require 'rails_helper'

RSpec.describe "Invoice random API" do
  it "finds a random invoice" do
    create_list(:invoice, 3)

    get '/api/v1/invoices/random'
    random_invoice = JSON.parse(response.body)

    expect(random_invoice["customer_id"].class).to eq(Fixnum)
    expect(random_invoice["merchant_id"].class).to eq(Fixnum)
  end
end
