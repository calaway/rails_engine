require 'rails_helper'

RSpec.describe "Customer random API" do
  it "finds a random customer" do
    create_list(:customer, 3)

    get '/api/v1/customers/random'
    random_customer = JSON.parse(response.body)

    expect(random_customer["first_name"].class).to eq(String)
  end
end
