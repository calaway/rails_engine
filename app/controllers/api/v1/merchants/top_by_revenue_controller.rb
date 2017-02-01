class Api::V1::Merchants::TopByRevenueController < ApiController
  def index
    render json: Merchant.top_revenue_merchants(params[:quantity])
  end
end
