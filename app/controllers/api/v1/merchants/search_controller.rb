class Api::V1::Merchants::SearchController < ApiController
  def show
    search_key = merchant_params.keys.first
    search_value = merchant_params.values.first
    render json: Merchant.find_by(merchant_params)
  end

  def index
    search_key = merchant_params.keys.first
    search_value = merchant_params.values.first
    render json: Merchant.where(merchant_params)
  end

  def random
    render json: Merchant.random
  end

  private
  def merchant_params
    params.permit(:id,	:name,	:created_at,	:updated_at)
  end
end
