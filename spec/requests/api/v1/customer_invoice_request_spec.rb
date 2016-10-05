require 'rails_helper'

RSpec.describe "Customer invoices API" do
  it "finds invoices for a given customer" do
    customer = create(:customer, first_name: "Gob", last_name: "Bluth")
    3.times do
      invoice = create(:invoice, customer: customer)
    end
    create(:invoice)

    get "/api/v1/customer/#{customer.id}/invoices"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end
end
