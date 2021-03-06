require 'rails_helper'

RSpec.describe "Customer invoices API" do
  it "finds invoices for a given customer" do
    customer = create(:customer, first_name: "Gob", last_name: "Bluth")
    3.times do
      invoice = create(:invoice, customer: customer)
    end
    create(:invoice)

    get "/api/v1/customers/#{customer.id}/invoices"
    invoices_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices_response.count).to eq(3)
  end
end
