class Api::V1::Merchants::RevenueController < ApiController
  def show
    if params[:date]
      render json: Merchant.find(params[:id]).revenue_by_date(params[:date]), serializer: MerchantRevenueSerializer
    else
      render json: Merchant.find(params[:id]).revenue, serializer: MerchantRevenueSerializer
    end
  end
end
