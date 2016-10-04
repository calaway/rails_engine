require 'rails_helper'

RSpec.describe "Item random API" do
  it "finds a random item" do
    create_list(:item, 3)

    get '/api/v1/items/random'
    random_item = JSON.parse(response.body)

    expect(random_item["name"].class).to eq(String)
    expect(random_item["description"].class).to eq(String)
  end
end
