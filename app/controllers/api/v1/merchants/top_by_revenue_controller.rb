class Api::V1::Merchants::TopByRevenueController < ApplicationController
  def index
    render json: Merchant.top_revenue_merchants(params[:quantity])
  end
end
