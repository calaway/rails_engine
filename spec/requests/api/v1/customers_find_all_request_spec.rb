require 'rails_helper'

describe "Customers find all API" do
  it "finds all customers by id" do
    create(:customer)
    customer = create(:customer, last_name: "Turing")

    get "/api/v1/customers/find_all?id=#{customer.id}"
    response_customers = JSON.parse(response.body)

    expect(response_customers.first["last_name"]).to eq("Turing")
  end
end
