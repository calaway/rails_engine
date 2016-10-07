require 'rails_helper'

describe "Customers find API" do
  it "finds one customer by id" do
    create(:customer)
    customer = create(:customer, last_name: "Turing")

    get "/api/v1/customers/find?id=#{customer.id}"
    response_customer = JSON.parse(response.body)

    expect(response_customer["last_name"]).to eq("Turing")
  end

  it "finds one customer by first_name" do
    create(:customer)
    customer = create(:customer, first_name: "Turing")

    get "/api/v1/customers/find?first_name=#{customer.first_name}"
    response_customer = JSON.parse(response.body)

    expect(response_customer["first_name"]).to eq("Turing")
  end

  it "finds one customer by last_name" do
    create(:customer)
    customer = create(:customer, last_name: "Turing")

    get "/api/v1/customers/find?last_name=#{customer.last_name}"
    response_customer = JSON.parse(response.body)

    expect(response_customer["last_name"]).to eq("Turing")
  end
end
