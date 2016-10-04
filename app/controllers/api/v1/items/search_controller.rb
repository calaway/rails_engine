class Api::V1::Items::SearchController < ApplicationController
  def show
    search_key = item_params.keys.first
    search_value = item_params.values.first
    if search_key == ("name" || "description")
      render json: Item.find_by("lower(#{search_key}) = ?", search_value.downcase)
    else
      render json: Item.find_by("#{search_key} = ?", search_value)
    end
    # if params[:name]
    #   render json: Item.find_by(name: params[:name])
    # elsif params[:description]
    #   render json: Item.find_by(description: params[:description])
    # elsif params[:unit_price]
    #   render json: Item.find_by(unit_price: params[:unit_price])
    # elsif params[:merchant_id]
    #   render json: Item.find_by(merchant_id: params[:merchant_id])
    # end
  end

  def index
    search_key = item_params.keys.first
    search_value = item_params.values.first.downcase
    if search_key == ("name" || "description")
      render json: Item.where("lower(#{search_key}) = ?", search_value)
    else
      render json: Item.where("#{search_key} = ?", search_value)
    end
  end

  def random
    render json: Item.random
  end

private
  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id)
  end
end
