require 'rails_helper'

describe "Customers find all API" do
  it "finds all customers by id" do
    create(:customer)
    customer = create(:customer, last_name: "Turing")

    get "/api/v1/customers/find_all?id=#{customer.id}"
    response_customers = JSON.parse(response.body)

    expect(response_customers.first["last_name"]).to eq("Turing")
  end

  it "finds all customers by first_name" do
    create(:customer)
    create(:customer, first_name: "Alan", last_name: "Turing")
    create(:customer, first_name: "Alan", last_name: "Guacamole")

    get "/api/v1/customers/find_all?first_name=Alan"
    response_customers = JSON.parse(response.body)

    expect(response_customers.count).to eq(2)
    expect(response_customers.first["last_name"]).to eq("Turing")
  end

  it "finds all customers by last_name" do
    create(:customer)
    create(:customer, first_name: "Alan",   last_name: "Turing")
    create(:customer, first_name: "Mertle", last_name: "Turing")

    get "/api/v1/customers/find_all?last_name=Turing"
    response_customers = JSON.parse(response.body)

    expect(response_customers.count).to eq(2)
    expect(response_customers.first["first_name"]).to eq("Alan")
  end
end
