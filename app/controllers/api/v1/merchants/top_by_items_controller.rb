class Api::V1::Merchants::TopByItemsController < ApplicationController
  def index
    render json: Merchant.top_item_merchants(params[:quantity])
  end
end
