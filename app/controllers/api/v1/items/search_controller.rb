class Api::V1::Items::SearchController < ApplicationController
  def show
    search_key = item_params.keys.first
    search_value = item_params.values.first
    if search_key == ("name" || "description")
      render json: Item.find_by_params(search_key, search_value)
    else
      render json: Item.find_by_params(search_key, search_value)
    end
  end

  def index
    search_key = item_params.keys.first
    search_value = item_params.values.first
    # if search_key == ("name" || "description")
      render json: Item.where_by_params(search_key, search_value)
    # else
      # render json: Item.where_by_params(search_key, search_value)
    # end
  end

  def random
    render json: Item.random
  end

private
  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id)
  end
end
