class Api::V1::Items::MerchantsController < ApplicationController
  def show
    item = Item.find(params[:id])
    render json: item.merchant
  end
end
