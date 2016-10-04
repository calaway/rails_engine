class Api::V1::Items::SearchController < ApplicationController
  def show
    search_key = params.keys.first.to_sym
    search_value = params.values.first
    render json: Item.find_by(:"#{search_key}" => search_value)
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
end
