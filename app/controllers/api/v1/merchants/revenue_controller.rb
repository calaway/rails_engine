class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    # render json: Merchant.find(params[:id]).revenue
    # render json: "{\"revenue\":\"#{Merchant.find(params[:id]).revenue / 100.0}\"}"
    render json: Merchant.find(params[:id]).revenue_hash
  end
end
