require 'rails_helper'

describe "Customers API" do
  it "returns a list of customers" do
    create_list(:customer, 2)

    get '/api/v1/customers'
    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(2)
  end

  it "returns a single customer" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end
